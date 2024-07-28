import 'dart:async';

import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/setting/about.dart';
import 'package:aniflow/core/common/setting/check_app_update.dart';
import 'package:aniflow/core/common/setting/display_adult_content.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/setting.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/settings/settings_category.dart';
import 'package:aniflow/feature/settings/settings_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

sealed class SettingEvent {}

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

class _OnTitleLanguageChanged extends SettingEvent {
  _OnTitleLanguageChanged(this.titleLanguage);

  final UserTitleLanguage titleLanguage;
}

class _OnStaffLanguageChanged extends SettingEvent {
  _OnStaffLanguageChanged(this.staffNameLanguage);

  final UserStaffNameLanguage staffNameLanguage;
}

class _OnScoreFormatChanged extends SettingEvent {
  _OnScoreFormatChanged(this.scoreFormat);

  final ScoreFormat scoreFormat;
}

class _OnDisplayAdultContentChanged extends SettingEvent {
  _OnDisplayAdultContentChanged(this.enabled);

  final bool enabled;
}

@injectable
class SettingsBloc extends Bloc<SettingEvent, SettingsState>
    with AutoCancelMixin {
  SettingsBloc(
    this._userDataRepository,
    this._authRepository,
    this._messageRepository,
  ) : super(SettingsState()) {
    on<_OnThemeSettingChanged>(
      (event, emit) => emit(state.copyWith(theme: event.setting)),
    );
    on<_OnMediaTypeChanged>(
      (event, emit) => emit(state.copyWith(type: event.type)),
    );
    on<_OnTitleLanguageChanged>(
      (event, emit) =>
          emit(state.copyWith(selectedTitleLanguage: event.titleLanguage)),
    );
    on<_OnScoreFormatChanged>(
      (event, emit) =>
          emit(state.copyWith(selectedScoreFormat: event.scoreFormat)),
    );
    on<_OnStaffLanguageChanged>(
      (event, emit) => emit(
          state.copyWith(selectedStaffNameLanguage: event.staffNameLanguage)),
    );
    on<_OnDisplayAdultContentChanged>(
      (event, emit) => emit(state.copyWith(displayAdultContent: event.enabled)),
    );
    on<OnListOptionChanged>(_onListOptionChanged);

    _init();
  }

  final UserDataRepository _userDataRepository;
  final AuthRepository _authRepository;
  final MessageRepository _messageRepository;

  final Map<String, CancelToken> _cancelTokenMap = {};

  void _init() async {
    autoCancel(
      () => _userDataRepository.themeSettingStream.listen(
        (settings) => safeAdd(_OnThemeSettingChanged(settings)),
      ),
    );

    autoCancel(
      () => _userDataRepository.mediaTypeStream.listen(
        (type) => safeAdd(_OnMediaTypeChanged(type)),
      ),
    );

    autoCancel(
      () => _userDataRepository.scoreFormatStream.listen(
        (format) => safeAdd(_OnScoreFormatChanged(format)),
      ),
    );

    autoCancel(
      () => _userDataRepository.displayAdultContentStream.listen(
        (enabled) => safeAdd(_OnDisplayAdultContentChanged(enabled)),
      ),
    );

    autoCancel(
      () => _userDataRepository.titleLanguageStream.listen(
        (language) => safeAdd(_OnTitleLanguageChanged(language)),
      ),
    );

    autoCancel(
      () => _userDataRepository.staffLanguageStream.listen(
        (language) => safeAdd(_OnStaffLanguageChanged(language)),
      ),
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
        await _userDataRepository.setThemeSetting(setting);
      case MediaType():
        await _userDataRepository.setMediaType(setting);
      case CheckAppUpdate():
      // _onClickCheckAppUpdate();

      default:
        throw 'Invalid type';
    }

    if (result is LoadError) {
      final message =
          await ErrorHandler.convertExceptionToMessage(result.exception);
      if (message != null) {
        _messageRepository.showMessage(message);
      }
    }
  }

  CancelToken _cancelRequestAndReturnNewToken(Type settingType) {
    _cancelTokenMap[settingType.toString()]?.cancel();
    final newCancelToken = CancelToken();
    _cancelTokenMap[settingType.toString()] = newCancelToken;
    return newCancelToken;
  }
}

extension SettingsBlocEx on SettingsBloc {
  List<SettingCategory> buildSettingCategoryList() {
    final enableAdultFeature =
        _userDataRepository.isAdultContentsFeatureEnabled;
    final appUpdateDialogFeatureEnabled =
        _userDataRepository.isAppUpdateDialogFeatureEnabled;
    return [
      SettingCategory(
        titleBuilder: (context) => context.appLocal.app,
        settingItems: [
          ListSettingItem(
            titleBuilder: (context) => context.appLocal.theme,
            selectedOption: state.theme._createSettingOption(),
            options: ThemeSetting.values
                .map((e) => e._createSettingOption())
                .toList(),
          ),
          ListSettingItem(
            titleBuilder: (context) => context.appLocal.contents,
            selectedOption: state.type._createSettingOption(),
            options:
                MediaType.values.map((e) => e._createSettingOption()).toList(),
          ),
          if (appUpdateDialogFeatureEnabled)
            CheckForUpdateSettingItem(
              titleBuilder: (context) => context.appLocal.checkForUpdate,
            ),
        ],
      ),
      SettingCategory(
        titleBuilder: (context) =>
            '${context.appLocal.animeLabel} & ${context.appLocal.mangaLabel}',
        settingItems: [
          ListSettingItem(
            titleBuilder: (context) => context.appLocal.titleLanguage,
            selectedOption: state.selectedTitleLanguage._createSettingOption(),
            options: UserTitleLanguage.values
                .map((e) => e._createSettingOption())
                .toList(),
          ),
          ListSettingItem(
            titleBuilder: (context) =>
                context.appLocal.staffCharacterNameLanguage,
            selectedOption:
                state.selectedStaffNameLanguage._createSettingOption(),
            options: UserStaffNameLanguage.values
                .map((e) => e._createSettingOption())
                .toList(),
          ),
          if (enableAdultFeature)
            SwitchSettingItem(
              titleBuilder: (context) => '18+ ${context.appLocal.contents}',
              current:
                  DisplayAdultContent.getSetting(state.displayAdultContent),
            ),
        ],
      ),
      SettingCategory(
        titleBuilder: (context) => context.appLocal.list,
        settingItems: [
          ListSettingItem(
            titleBuilder: (context) => context.appLocal.scoringSystem,
            selectedOption: state.selectedScoreFormat._createSettingOption(),
            options: ScoreFormat.values
                .map((e) => e._createSettingOption())
                .toList(),
          ),
        ],
      ),
      SettingCategory(
        titleBuilder: (context) => context.appLocal.about,
        settingItems: [
          if (_userDataRepository.isGithubLinkFeatureEnabled)
            GithubLinkSettingItem(),
          SingleLineWithTapActionSettingItem<About>(
            titleBuilder: (context) => context.materialLocal.moreButtonTooltip,
          ),
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
          setting: this,
          descriptionBuilder: (context) => 'Romaji (Shingeki no kyojin)',
        );
      case UserTitleLanguage.english:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) => 'English (Attack on Titan)',
        );
      case UserTitleLanguage.native:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) => 'Native (進撃の巨人)',
        );
    }
  }
}

extension on UserStaffNameLanguage {
  SettingOption<UserStaffNameLanguage> _createSettingOption() {
    switch (this) {
      case UserStaffNameLanguage.romajiWestern:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) =>
              'Romaji, Western Order (Atsumi Tanezaki)',
        );
      case UserStaffNameLanguage.romaji:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) => 'Romaji (Tanezaki Atsumi)',
        );
      case UserStaffNameLanguage.native:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) => 'Native (種﨑敦美)',
        );
    }
  }
}

extension on ScoreFormat {
  SettingOption<ScoreFormat> _createSettingOption() {
    switch (this) {
      case ScoreFormat.point100:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) => '100 Point (55/100)',
        );
      case ScoreFormat.point10Decimal:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) => '10 Point Decimal (5.5/10)',
        );
      case ScoreFormat.point10:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) => '10 Point (5/10)',
        );
      case ScoreFormat.point5:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) => '5 Star (3/5)',
        );
      case ScoreFormat.point3:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) => '3 Point Smiley :)',
        );
    }
  }
}

extension on ThemeSetting {
  SettingOption<ThemeSetting> _createSettingOption() {
    switch (this) {
      case ThemeSetting.dark:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) => context.appLocal.dark,
        );
      case ThemeSetting.light:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) => context.appLocal.light,
        );
      case ThemeSetting.system:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) => context.appLocal.systemDefault,
        );
    }
  }
}

extension on MediaType {
  SettingOption<MediaType> _createSettingOption() {
    switch (this) {
      case MediaType.anime:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) => context.appLocal.animeLabel,
        );
      case MediaType.manga:
        return SettingOption(
          setting: this,
          descriptionBuilder: (context) => context.appLocal.mangaLabel,
        );
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
