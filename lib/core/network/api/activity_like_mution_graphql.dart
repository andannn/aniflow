
String get activityLikeMutationGraphql => '''
mutation(\$id: Int, \$type: LikeableType) {
  ToggleLikeV2(id: \$id, type: \$type) {
    ...on ListActivity {
      id
    }
  }
}
''';