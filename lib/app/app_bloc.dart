import 'package:aniflow/app/app_state.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class AppEvent {}

class _OnThemeSettingChanged extends AppEvent {
  final ThemeSetting themeMode;

  _OnThemeSettingChanged(this.themeMode);
}

@injectable
class AppBloc extends Bloc<AppEvent, AppState> with AutoCancelMixin {
  AppBloc(this._userDataRepository)
      : super(const AppState()) {
    on<_OnThemeSettingChanged>(
      (event, emit) => emit(state.copyWith(theme: event.themeMode)),
    );

    autoCancel(
      () => _userDataRepository.themeSettingStream.listen(
        (theme) => safeAdd(
          _OnThemeSettingChanged(theme),
        ),
      ),
    );
  }

  final UserDataRepository _userDataRepository;
}
