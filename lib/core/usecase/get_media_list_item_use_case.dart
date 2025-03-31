import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(env: [AfEnvironment.mobile, AfEnvironment.desktop])
class GetMediaListItemStreamUseCase {
  GetMediaListItemStreamUseCase(
      this._authRepository, this._mediaListRepository);

  final AuthRepository _authRepository;
  final MediaListRepository _mediaListRepository;

  Stream<MediaListItemModel?> invoke(String mediaId) {
    final userDataStream = _authRepository.getAuthedUserStream();
    return userDataStream.switchMap(
      (userData) => userData != null
          ? _mediaListRepository.getMediaListItemByUserAndIdStream(
              userId: userData.id,
              animeId: mediaId,
            )
          : Stream.value(null),
    );
  }
}
