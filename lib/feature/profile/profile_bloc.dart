import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/loading_state_mixin.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/data/user_info_repository.dart';
import 'package:aniflow/feature/profile/profile_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class ProfileEvent {}

class _OnUserDataLoaded extends ProfileEvent {
  _OnUserDataLoaded({required this.userData});

  final UserModel userData;
}

class _LoadingStateChanged extends ProfileEvent {
  _LoadingStateChanged({required this.isLoading});

  final bool isLoading;
}

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState>
    with LoadingControllerMixin<ProfileEvent, ProfileState> {
  ProfileBloc(
    @factoryParam this._userId,
    this._userInfoRepository,
    this._userDataRepository,
    this._messageRepository,
  ) : super(ProfileState()) {
    on<_OnUserDataLoaded>(
      (event, emit) => emit(state.copyWith(userData: event.userData)),
    );
    on<_LoadingStateChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );

    _init();
  }

  final String? _userId;
  final UserInfoRepository _userInfoRepository;
  final UserDataRepository _userDataRepository;
  final MessageRepository _messageRepository;

  UserTitleLanguage get userTitleLanguage =>
      _userDataRepository.userTitleLanguage;

  UserStaffNameLanguage get userStaffNameLanguage =>
      _userDataRepository.userStaffNameLanguage;

  void _init() async {
    final userId = _userId ?? _userDataRepository.authedUserId;
    final userData = await _userInfoRepository.getUserDataById(userId!);
    safeAdd(_OnUserDataLoaded(userData: userData));
  }

  @override
  void onLoadingFinished(List<LoadError<dynamic>> errors) {
    _messageRepository.handleException(errors.first.exception);
  }

  @override
  void onLoadingStateChanged(bool isLoading) {
    safeAdd(_LoadingStateChanged(isLoading: isLoading));
  }
}
