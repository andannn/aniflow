import 'dart:async';

import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/usecase/get_media_list_item_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('auth_repository_test', () {
    late GetMediaListItemStreamUseCase useCase;
    late _MockAuthRepository authRepository;
    late _MockMediaListRepository mediaListRepository;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      authRepository = _MockAuthRepository();
      mediaListRepository = _MockMediaListRepository();
      useCase =
          GetMediaListItemStreamUseCase(authRepository, mediaListRepository);
    });

    test('get media list item stream test', () async {
      final mediaListStream = useCase.invoke("1");
      authRepository.updateUser(null);
      authRepository.updateUser(UserModel(id: "1"));
      expect(mediaListStream, emitsInOrder([null, MediaListItemModel()]));
    });

    test('get media list item stream logout test', () async {
      final mediaListStream = useCase.invoke("1");
      authRepository.updateUser(UserModel(id: "1"));
      authRepository.updateUser(null);
      expect(mediaListStream, emitsInOrder([MediaListItemModel(), null]));
    });
  });
}

class _MockMediaListRepository extends Fake implements MediaListRepository {
  @override
  Stream<MediaListItemModel?> getMediaListItemByUserAndIdStream(
      {required String userId, required String animeId}) {
    return Stream.value(MediaListItemModel());
  }
}

class _MockAuthRepository extends Fake implements AuthRepository {
  final _streamController = StreamController<UserModel?>();

  @override
  Stream<UserModel?> getAuthedUserStream() {
    return _streamController.stream;
  }

  void updateUser(UserModel? user) {
    _streamController.add(user);
  }

  bool hasListener() {
    return _streamController.hasListener;
  }
}
