
String get userFavoriteMangaQueryGraphQl =>
'''
query(\$UserId: Int, \$perPage: Int){
  User(id: \$UserId) {
    id
    name
    favourites(page: 1) {
      manga(page: 1, perPage: \$perPage) {
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