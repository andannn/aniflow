String get userContentQueryGraphql => '''
          id
          name
          avatar {
            large
            medium
          }
          bannerImage
''';