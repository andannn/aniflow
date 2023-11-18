import 'package:aniflow/core/common/model/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/model/setting/user_title_language.dart';
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
  });

  final UserTitleLanguage? titleLanguage;
  final UserStaffNameLanguage? userStaffNameLanguage;
  final bool? displayAdultContent;
}

/// Graphql to query user info.
String get updateUserMotionGraphQLString => '''
mutation (\$titleLanguage: UserTitleLanguage, \$displayAdultContent: Boolean, \$userStaffNameLanguage: UserStaffNameLanguage) {
  UpdateUser(titleLanguage: \$titleLanguage, displayAdultContent: \$displayAdultContent, staffNameLanguage: \$userStaffNameLanguage) {
    $userContentWithSettingsQueryGraphql
  }
}
''';
