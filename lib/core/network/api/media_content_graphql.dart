String get mediaContentQueryGraphql => '''
      id
      type
      format
      status
      season
      coverImage {
        extraLarge
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
        }
      }
''';