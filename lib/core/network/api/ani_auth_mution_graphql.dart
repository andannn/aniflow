import 'package:aniflow/core/network/api/user_content_graphql.dart';

const String authCheckMotion = '''
mutation MediaListQuery {
  UpdateUser {
    id
  }
}
''';

/// Graph ql to query user info.
String get userInfoMotionGraphQLString =>
'''
mutation UpdateUserMutation {
  UpdateUser {
    $userContentWithSettingsQueryGraphql
  }
}
''';
