
String get userAnimeGenresStatsQueryGraphQl =>
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

String get userMangaGenresStatsQueryGraphQl =>
    '''
query (\$id: Int, \$sort: [UserStatisticsSort]){
  User(id: \$id) {
    id
    statistics {
      manga {
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

String get userAnimeStudiosStatsQueryGraphQl =>
    '''
query (\$id: Int, \$sort: [UserStatisticsSort]){
  User(id: \$id) {
    id
    statistics {
      anime {
        studios(limit: 6, sort: \$sort) {
          count
          meanScore
          minutesWatched
          chaptersRead
          mediaIds
          studio {
            id
            name
            isAnimationStudio
            siteUrl
            isFavourite
          }
        }
      }
    }
  }
}
''';

String get userAnimeStaffStatsQueryGraphQl =>
    '''
query (\$id: Int, \$sort: [UserStatisticsSort]){
  User(id: \$id) {
    id
    statistics {
      anime {
        staff(limit: 6, sort: \$sort) {
          count
          meanScore
          minutesWatched
          chaptersRead
          mediaIds
					staff {
            id
            name {
              first
              middle
              last
              full
              native
            }
            image {
              large
              medium
            }
					}
        }
      }
    }
  }
}
''';

String get userMangaStaffStatsQueryGraphQl =>
    '''
query (\$id: Int, \$sort: [UserStatisticsSort]){
  User(id: \$id) {
    id
    statistics {
      manga {
        staff(limit: 6, sort: \$sort) {
          count
          meanScore
          minutesWatched
          chaptersRead
          mediaIds
					staff {
            id
            name {
              first
              middle
              last
              full
              native
            }
            image {
              large
              medium
            }
					}
        }
      }
    }
  }
}
''';

String get userAnimeVoiceActorStatsQueryGraphQl =>
    '''
query (\$id: Int, \$sort: [UserStatisticsSort]){
  User(id: \$id) {
    id
    statistics {
      anime {
        voiceActors(limit: 6, sort: \$sort) {
          count
          meanScore
          minutesWatched
          chaptersRead
          mediaIds
					voiceActor {
            id
            name {
              first
              middle
              last
              full
              native
            }
            image {
              large
              medium
            }
					}
        }
      }
    }
  }
}
''';

String get userAnimeTagStatsQueryGraphQl =>
    '''
query (\$id: Int, \$sort: [UserStatisticsSort]){
  User(id: \$id) {
    id
    statistics {
      anime {
        tags(limit: 6, sort: \$sort) {
          count
          meanScore
          minutesWatched
          chaptersRead
          mediaIds
          tag {
            id
            name
            description
            category
            rank
          }
        }
      }
    }
  }
}
''';

String get userMangaTagStatsQueryGraphQl =>
    '''
query (\$id: Int, \$sort: [UserStatisticsSort]){
  User(id: \$id) {
    id
    statistics {
      manga {
        tags(limit: 6, sort: \$sort) {
          count
          meanScore
          minutesWatched
          chaptersRead
          mediaIds
          tag {
            id
            name
            description
            category
            rank
          }
        }
      }
    }
  }
}
''';
