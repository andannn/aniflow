
String get searchQueryGraphql =>
'''
query (\$page: Int, \$perPage: Int, \$search: String) {
  page: Page(page: \$page, perPage: \$perPage) {
    media(type: ANIME, sort: [POPULARITY_DESC], search: \$search) {
      id
      title {
        romaji
        english
        native
      }
      episodes
      seasonYear
      season
      status
      coverImage {
        extraLarge
        large
        medium
        color
      }
    }
  }
}
''';
