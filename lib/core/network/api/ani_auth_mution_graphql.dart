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
    id
    name
    avatar {
      large
      medium
    }
    bannerImage
  }
}
''';
