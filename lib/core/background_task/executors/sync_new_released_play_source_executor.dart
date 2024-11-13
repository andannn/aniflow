import 'package:aniflow/core/background_task/executor.dart';
import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/hi_animation_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/extension/media_list_item_model_extension.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

const _tag = 'SyncNewReleasedPlaySourceExecutor';

@injectable
class SyncNewReleasedPlaySourceExecutor implements Executor {
  const SyncNewReleasedPlaySourceExecutor(this._hiAnimationRepository,
      this._mediaListRepository, this._authRepository);

  final HiAnimationRepository _hiAnimationRepository;
  final MediaListRepository _mediaListRepository;
  final AuthRepository _authRepository;

  @override
  Future<bool> execute() async {
    final authedUser = await _authRepository.getAuthedUser();

    if (authedUser == null) {
      logger.d('$_tag No Authed user, just finish task.');

      return true;
    }

    final userMediaList = await _mediaListRepository.getSortedMediaListStream(
      status: [MediaListStatus.current, MediaListStatus.planning],
      userId: authedUser.id,
      type: MediaType.anime,
    ).first;
    final newUpdateList = userMediaList.newUpdateList;
    if (newUpdateList.isEmpty) {
      logger.d('$_tag No new released media, just finish task.');

      return true;
    }

    final tasks = newUpdateList
        .map((media) {
          final mediaModel = media.mediaModel;
          final mediaListModel = media.mediaListModel;
          final progress = mediaListModel?.progress ?? 0;
          final hasNextReleasingEpisode = media.hasNextReleasedEpisode == true;
          final nextProgress = hasNextReleasingEpisode ? progress + 1 : null;
          if (nextProgress == null) {
            return null;
          }

          return _hiAnimationRepository.searchPlaySourceByKeyword(
            mediaModel.id,
            [
              mediaModel.title?.english ?? "",
              mediaModel.title?.romaji ?? "",
              mediaModel.title?.native ?? "",
            ],
            nextProgress.toString(),
          );
        })
        .whereNotNull()
        .toList();
    final results = await Future.wait(tasks);
    return results.every(
      (result) =>
          result is LoadSuccess ||
          // not found play source
          (result as LoadError).exception is NotFoundEpisodeException,
    );
  }
}
