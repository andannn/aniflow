import 'dart:async';

import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/about.dart';
import 'package:aniflow/core/common/setting/display_adult_content.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/setting.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/settings_repository.dart';
import 'package:aniflow/feature/settings/bloc/settings_category.dart';
import 'package:aniflow/feature/settings/bloc/settings_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

sealed class SettingEvent {}

class _OnAniListSettingsChanged extends SettingEvent {
  _OnAniListSettingsChanged(this.settings);

  final AniListSettings settings;
}

class _OnThemeSettingChanged extends SettingEvent {
  _OnThemeSettingChanged(this.setting);

  final ThemeSetting setting;
}

class OnListOptionChanged extends SettingEvent {
  OnListOptionChanged(this.setting);

  final Setting setting;
}

class _OnMediaTypeChanged extends SettingEvent {
  _OnMediaTypeChanged(this.type);

  final MediaType type;
}

@injectable
class SettingsBloc extends Bloc<SettingEvent, SettingsState> {
  SettingsBloc(this._settingsRepository, this._authRepository)
      : super(SettingsState()) {
    on<_OnAniListSettingsChanged>(
      (event, emit) => emit(state.copyWith(settings: event.settings)),
    );
    on<_OnThemeSettingChanged>(
      (event, emit) => emit(state.copyWith(theme: event.setting)),
    );
    on<_OnMediaTypeChanged>(
      (event, emit) => emit(state.copyWith(type: event.type)),
    );
    on<OnListOptionChanged>(_onListOptionChanged);

    _init();
  }

  final SettingsRepository _settingsRepository;
  final AuthRepository _authRepository;

  StreamSubscription? _settingsSub;
  StreamSubscription? _themeSub;
  StreamSubscription? _mediaTypeSub;

  final Map<String, CancelToken> _cancelTokenMap = {};

  @override
  Future<void> close() {
    _settingsSub?.cancel();
    _themeSub?.cancel();
    _mediaTypeSub?.cancel();
    return super.close();
  }

  void _init() async {
    _settingsSub ??= _authRepository.getAniListSettingsStream().listen(
      (settings) {
        add(_OnAniListSettingsChanged(settings));
      },
    );

    _themeSub ??= _settingsRepository.getThemeSettingStream().listen(
      (settings) {
        logger.d('JQN ');
        add(_OnThemeSettingChanged(settings));
      },
    );

    _mediaTypeSub ??= _settingsRepository.getMediaTypeStream().listen(
      (type) {
        add(_OnMediaTypeChanged(type));
      },
    );
  }

  FutureOr<void> _onListOptionChanged(
      OnListOptionChanged event, Emitter<SettingsState> emit) async {
    final setting = event.setting;
    LoadResult? result;
    switch (setting) {
      case UserTitleLanguage():
        result = await _authRepository.updateUserSettings(
          userTitleLanguage: setting,
          token: _cancelRequestAndReturnNewToken(setting.runtimeType),
        );
      case DisplayAdultContent():
        result = await _authRepository.updateUserSettings(
          displayAdultContent: setting.isOn,
          token: _cancelRequestAndReturnNewToken(setting.runtimeType),
        );
      case UserStaffNameLanguage():
        result = await _authRepository.updateUserSettings(
          userStaffNameLanguage: setting,
          token: _cancelRequestAndReturnNewToken(setting.runtimeType),
        );
      case ScoreFormat():
        result = await _authRepository.updateUserSettings(
          scoreFormat: setting,
          token: _cancelRequestAndReturnNewToken(setting.runtimeType),
        );
      case ThemeSetting():
        await _settingsRepository.setThemeSetting(setting);
      case MediaType():
        await _settingsRepository.setMediaType(setting);

      default:
        throw 'Invalid type';
    }

    if (result is LoadError) {
      ErrorHandler.handleException(exception: result.exception);
    }
  }

  CancelToken _cancelRequestAndReturnNewToken(Type settingType) {
    _cancelTokenMap[settingType.toString()]?.cancel();
    final newCancelToken = CancelToken();
    _cancelTokenMap[settingType.toString()] = newCancelToken;
    return newCancelToken;
  }
}

extension SettingsStateEx on SettingsState {
  List<SettingCategory> get categories => _buildSettingCategoryList();

  List<SettingCategory> _buildSettingCategoryList() {
    final selectedTitleLanguage =
        settings?.userTitleLanguage ?? UserTitleLanguage.native;
    final selectedUserStaffNameLanguage =
        settings?.userStaffNameLanguage ?? UserStaffNameLanguage.native;
    final isDisplayAdultContent = settings?.displayAdultContent ?? false;
    final selectedScoreFormat = settings?.scoreFormat ?? ScoreFormat.point100;
    final selectedTheme = theme;
    final selectedMediaType = type;

    return [
      SettingCategory(
        title: 'App',
        settingItems: [
          ListSettingItem(
            title: 'Dark mode preference',
            selectedOption: selectedTheme._createSettingOption(),
            options: ThemeSetting.values
                .map((e) => e._createSettingOption())
                .toList(),
          ),
          ListSettingItem(
            title: 'Media contents',
            selectedOption: selectedMediaType._createSettingOption(),
            options:
                MediaType.values.map((e) => e._createSettingOption()).toList(),
          ),
        ],
      ),
      SettingCategory(
        title: 'Anime & Manga',
        settingItems: [
          ListSettingItem(
            title: 'Title Language',
            selectedOption: selectedTitleLanguage._createSettingOption(),
            options: UserTitleLanguage.values
                .map((e) => e._createSettingOption())
                .toList(),
          ),
          ListSettingItem(
            title: 'Staff & Character Name Language',
            selectedOption:
                selectedUserStaffNameLanguage._createSettingOption(),
            options: UserStaffNameLanguage.values
                .map((e) => e._createSettingOption())
                .toList(),
          ),
          SwitchSettingItem(
            title: '18+ content',
            current: DisplayAdultContent.getSetting(isDisplayAdultContent),
          ),
        ],
      ),
      SettingCategory(
        title: 'Lists',
        settingItems: [
          ListSettingItem(
            title: 'Scoring System',
            selectedOption: selectedScoreFormat._createSettingOption(),
            options: ScoreFormat.values
                .map((e) => e._createSettingOption())
                .toList(),
          ),
        ],
      ),
      SettingCategory(
        title: 'About',
        settingItems: [
          SingleLineWithTapActionSettingItem<About>(title: 'More Info')
        ],
      ),
    ];
  }
}

extension on UserTitleLanguage {
  SettingOption<UserTitleLanguage> _createSettingOption() {
    switch (this) {
      case UserTitleLanguage.romaji:
        return SettingOption(
            setting: this, description: 'Romaji (Shingeki no kyojin)');
      case UserTitleLanguage.english:
        return SettingOption(
            setting: this, description: 'English (Attack on Titan)');
      case UserTitleLanguage.native:
        return SettingOption(setting: this, description: 'Native (進撃の巨人)');
    }
  }
}

extension on UserStaffNameLanguage {
  SettingOption<UserStaffNameLanguage> _createSettingOption() {
    switch (this) {
      case UserStaffNameLanguage.romajiWestern:
        return SettingOption(
            setting: this,
            description: 'Romaji, Western Order (Atsumi Tanezaki)');
      case UserStaffNameLanguage.romaji:
        return SettingOption(
            setting: this, description: 'Romaji (Tanezaki Atsumi)');
      case UserStaffNameLanguage.native:
        return SettingOption(setting: this, description: 'Native (種﨑敦美)');
    }
  }
}

extension on ScoreFormat {
  SettingOption<ScoreFormat> _createSettingOption() {
    switch (this) {
      case ScoreFormat.point100:
        return SettingOption(setting: this, description: '100 Point (55/100)');
      case ScoreFormat.point10Decimal:
        return SettingOption(
            setting: this, description: '10 Point Decimal (5.5/10)');
      case ScoreFormat.point10:
        return SettingOption(setting: this, description: '10 Point (5/10)');
      case ScoreFormat.point5:
        return SettingOption(setting: this, description: '5 Star (3/5)');
      case ScoreFormat.point3:
        return SettingOption(setting: this, description: '3 Point Smiley :)');
    }
  }
}

extension on ThemeSetting {
  SettingOption<ThemeSetting> _createSettingOption() {
    switch (this) {
      case ThemeSetting.dark:
        return SettingOption(setting: this, description: 'Dark');
      case ThemeSetting.light:
        return SettingOption(setting: this, description: 'Light');
      case ThemeSetting.system:
        return SettingOption(setting: this, description: 'System default');
    }
  }
}

extension on MediaType {
  SettingOption<MediaType> _createSettingOption() {
    switch (this) {
      case MediaType.anime:
        return SettingOption(setting: this, description: 'Anime');
      case MediaType.manga:
        return SettingOption(setting: this, description: 'Manga');
    }
  }
}

extension SettingNeedRestart on Setting {
  bool get needRestart => switch (this) {
        DisplayAdultContent() => true,
        ScoreFormat() => true,
        UserTitleLanguage() => false,
        UserStaffNameLanguage() => false,
        _ => false,
      };
}
