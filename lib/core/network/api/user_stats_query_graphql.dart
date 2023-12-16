
String get userStatsQueryGraphQl =>
    '''
query (\$id: Int, \$sort: [UserStatisticsSort]){
  User(id: \$id) {
    id
    statistics {
      anime {
        genres(limit: 6, sort: \$sort) {
          count
          meanScore
          minutesWatched
          genre
          mediaIds
        }
      }
    }
  }
}
''';