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
  UpdateUserMotionParam(
      {this.titleLanguage, this.displayAdultContent});

  final UserTitleLanguage? titleLanguage;
  final bool? displayAdultContent;
}

/// Graphql to query user info.
String get updateUserMotionGraphQLString => '''
mutation (\$titleLanguage: UserTitleLanguage, \$displayAdultContent: Boolean) {
  UpdateUser(titleLanguage: \$titleLanguage, displayAdultContent: \$displayAdultContent) {
    $userContentWithSettingsQueryGraphql
  }
}
''';
