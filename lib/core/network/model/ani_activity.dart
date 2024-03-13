import 'package:aniflow/core/network/model/list_activity_dto.dart';
import 'package:aniflow/core/network/model/text_activity_dto.dart';

abstract class AniActivity {
  static AniActivity? mapToAniActivity(Map<String, dynamic> jsonMap) {
    switch (jsonMap['__typename']) {
      case 'TextActivity' :
        return TextActivityDto.fromJson(jsonMap);
      case 'ListActivity' :
        return ListActivityDto.fromJson(jsonMap);
    }

    return null;
  }
}
