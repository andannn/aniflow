import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/network/api/user_content_graphql.dart';

const String authCheckMotion = '''
mutation MediaListQuery {
  UpdateUser {
    id
  }
}
''';

class UpdateUserMotionParam {
  UpdateUserMotionParam({
    this.titleLanguage,
    this.displayAdultContent,
    this.userStaffNameLanguage,
    this.scoreFormat,
  });

  final UserTitleLanguage? titleLanguage;
  final UserStaffNameLanguage? userStaffNameLanguage;
  final bool? displayAdultContent;
  final ScoreFormat? scoreFormat;
}

/// Graphql to query user info.
String get updateUserMotionGraphQLString => '''
mutation (\$titleLanguage: UserTitleLanguage, \$displayAdultContent: Boolean, \$userStaffNameLanguage: UserStaffNameLanguage, \$scoreFormat: ScoreFormat) {
  UpdateUser(titleLanguage: \$titleLanguage, displayAdultContent: \$displayAdultContent, staffNameLanguage: \$userStaffNameLanguage, scoreFormat: \$scoreFormat) {
    $userContentWithSettingsQueryGraphql
  }
}
''';
