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
