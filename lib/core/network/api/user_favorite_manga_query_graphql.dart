
String get userFavoriteMangaQueryGraphQl =>
'''
query(\$UserId: Int, \$page: Int, \$perPage: Int){
  User(id: \$UserId) {
    id
    name
    favourites(page: 1) {
      manga(page: \$page, perPage: \$perPage) {
        nodes {
          id
          type
          format
          status
          season
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
    }
  }
}
''';