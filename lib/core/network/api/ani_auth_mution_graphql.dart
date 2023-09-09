const String authCheckMotion = '''
mutation MediaListQuery {
  UpdateUser {
    id
  }
}
''';

/// Graph ql to query user info.
String createUserInfoMotionGraphQLString() {
  return '''
mutation MediaListQuery {
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
}
