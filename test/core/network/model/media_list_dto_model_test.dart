import 'package:anime_tracker/core/network/model/media_list_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('short_network_anime_model_from_json', ()
  {
    final dummyData = {
      "id": 5318,
      "status": "COMPLETED",
      "score": 60,
      "progress": 26,
      "priority": 0,
      "notes": null,
      "updatedAt": 1511491706,
      "media": {
        "title": {
          "native": "カウボーイビバップ"
        }
      }
    };
    test('get_anime_list_dto', () async {
      MediaListDto.fromJson(dummyData);
    });
  });
}