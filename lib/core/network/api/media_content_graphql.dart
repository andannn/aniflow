String get mediaContentQueryGraphql => '''
      id
      type
      format
      status
      season
      seasonYear
      startDate {
        year
        month
        day
      }
      coverImage {
        extraLarge
        large
        medium
        color
      }
      title {
        romaji
        english
        native
      }
''';

String get mediaConnectionQueryGraphql => '''
      edges {
        relationType
        node {
          id
          type
          format
          status
          episodes
          seasonYear
          season
          source
          coverImage {
            extraLarge
            large
            medium
            color
          }
          title {
            romaji
            english
            native
          }
          startDate {
            year
            month
            day
          }
          endDate {
            year
            month
            day
          }
        }
      }
''';