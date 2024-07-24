import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/github_repository.dart';
import 'package:aniflow/core/data/model/github_user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class GithubLinkEvent {}

class _OnUserReady extends GithubLinkEvent {
  _OnUserReady(this.user);

  final GithubUserModel user;
}

sealed class GithubLinkState {}

class LoadingGithubLinkState extends GithubLinkState {}

class ReadyGithubLinkState extends GithubLinkState {
  ReadyGithubLinkState(this.user);

  final GithubUserModel user;
}

@injectable
class GithubLinkBloc extends Bloc<GithubLinkEvent, GithubLinkState>
    with AutoCancelMixin {
  GithubLinkBloc(this._githubRepository) : super(LoadingGithubLinkState()) {
    on<_OnUserReady>((event, emit) {
      emit(ReadyGithubLinkState(event.user));
    });

    autoCancel(
      () => _githubRepository.getMineGithubUserStream().listen(
            (user) => add(_OnUserReady(user)),
          ),
    );

    _githubRepository.refreshGithubInfo();
  }

  final GithubRepository _githubRepository;
}
