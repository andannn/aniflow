import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/message/snack_bar_message.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [AfEnvironment.mobile, AfEnvironment.desktop])
class MediaMarkWatchedUseCase {
  MediaMarkWatchedUseCase(this._messageRepository, this._mediaListRepository);

  final MessageRepository _messageRepository;
  final MediaListRepository _mediaListRepository;

  Future<void> onMarkWatched(
      String animeId, int progress, int? totalEpisode) async {
    final isFinished = progress == totalEpisode;
    final MediaListStatus status =
        isFinished ? MediaListStatus.completed : MediaListStatus.current;

    final result = await _mediaListRepository.updateMediaList(
        animeId: animeId, status: status, progress: progress);

    if (result is LoadError) {
      _messageRepository.handleException(result.exception);
    } else {
      if (isFinished) {
        _messageRepository.showMessage(const MediaCompletedMessage());
      } else {
        _messageRepository.showMessage(const MediaMarkWatchedMessage());
      }
    }
  }
}
