import 'package:anime_tracker/core/common/util/global_static_constants.dart';
import 'package:anime_tracker/core/data/media_list_repository.dart';
import 'package:anime_tracker/core/network/api/ani_save_media_list_mution_graphql.dart';
import 'package:anime_tracker/core/network/auth_data_source.dart';
import 'package:anime_tracker/core/network/util/http_status_util.dart';
import 'package:anime_tracker/core/shared_preference/aniflow_prefrences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('auth_data_source_test', () {
    late AuthDataSource authDataSource;
    setUp(() async {
      isUnitTest = true;
      SharedPreferences.setMockInitialValues({});
      await AniFlowPreferences().init();
      authDataSource = AuthDataSource();
    });

    test('save_media_list_motion', () async {
      try {
        await authDataSource.saveAnimeToAnimeList(MediaListMutationParam(
          entryId: 1,
          mediaId: 2,
          progress: 3,
          status: MediaListStatus.current,
          score: 12,
        ));
      } on NetworkException catch (_) {
        // catch.
      }
    });
  });
}
