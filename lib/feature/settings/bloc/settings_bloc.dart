import 'dart:async';

import 'package:aniflow/core/common/model/ani_list_settings.dart';
import 'package:aniflow/core/common/model/setting/display_adult_content.dart';
import 'package:aniflow/core/common/model/setting/setting.dart';
import 'package:aniflow/core/common/model/setting/user_title_language.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/settings_repository.dart';
import 'package:aniflow/feature/settings/bloc/settings_category.dart';
import 'package:aniflow/feature/settings/bloc/settings_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

sealed class SettingEvent {}

class _OnAniListSettingsChanged extends SettingEvent {
  _OnAniListSettingsChanged(this.settings);

  final AniListSettings settings;
}

class OnListOptionChanged extends SettingEvent {
  OnListOptionChanged(this.setting);

  final Setting setting;
}

class SettingsBloc extends Bloc<SettingEvent, SettingsState> {
  SettingsBloc({
    required AuthRepository authRepository,
    required SettingsRepository settingsRepository,
  })  : _settingsRepository = settingsRepository,
        _authRepository = authRepository,
        super(SettingsState()) {
    on<_OnAniListSettingsChanged>(_onAniListSettingsChanged);
    on<OnListOptionChanged>(_onListOptionChanged);

    _init();
  }

  final SettingsRepository _settingsRepository;
  final AuthRepository _authRepository;

  StreamSubscription? _settingsSub;

  final Map<String, CancelToken> _cancelTokenMap = {};

  @override
  Future<void> close() {
    _settingsSub?.cancel();
    return super.close();
  }

  void _init() async {
    _settingsRepository;
    _settingsSub ??= _authRepository.getAniListSettingsStream().listen(
      (settings) {
        add(_OnAniListSettingsChanged(settings));
      },
    );
  }

  FutureOr<void> _onAniListSettingsChanged(
      _OnAniListSettingsChanged event, Emitter<SettingsState> emit) {
    emit(state.copyWith(settings: event.settings));
  }

  FutureOr<void> _onListOptionChanged(
      OnListOptionChanged event, Emitter<SettingsState> emit) async {
    final setting = event.setting;
    switch (setting) {
      case UserTitleLanguage():
         unawaited(_authRepository.updateUserSettings(
          userTitleLanguage: setting,
          token: _cancelRequestAndReturnNewToken(setting.runtimeType),
        ));
      case DisplayAdultContent():
         unawaited(_authRepository.updateUserSettings(
          displayAdultContent: setting.isOn,
          token: _cancelRequestAndReturnNewToken(setting.runtimeType),
        ));
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
    final isDisplayAdultContent = settings?.displayAdultContent ?? false;

    return [
      SettingCategory(
        title: 'Theme',
        settingItems: [],
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
          SwitchSettingItem(
            title: '18+ content',
            current: DisplayAdultContent.getSetting(isDisplayAdultContent),
          ),
        ],
      ),
      SettingCategory(
        title: 'Lists',
        settingItems: [],
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
