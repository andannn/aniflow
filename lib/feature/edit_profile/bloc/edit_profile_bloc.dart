import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/feature/edit_profile/bloc/edit_profile_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class EditProfileEvent {}

class OnUserModelLoaded extends EditProfileEvent {
  final UserModel userModel;

  OnUserModelLoaded(this.userModel);
}

@injectable
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(
    this._authRepository,
  ) : super(const EditProfileState()) {
    on<OnUserModelLoaded>(
      (event, emit) => emit(state.copyWith(userModel: event.userModel)),
    );

    _authRepository.getAuthedUserStream().distinct().listen((modelOrNull) {
      if (modelOrNull != null) {
        add(OnUserModelLoaded(modelOrNull));
      }
    });
  }

  final AuthRepository _authRepository;

  @override
  void onChange(Change<EditProfileState> change) {
    super.onChange(change);

    logger.d('JQN ${change.nextState}');
  }
}
