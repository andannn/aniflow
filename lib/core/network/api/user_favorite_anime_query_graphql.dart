
String get userFavoriteAnimeQueryGraphQl =>
'''
query(\$UserId: Int, \$perPage: Int){
  User(id: \$UserId) {
    id
    name
    favourites(page: 1) {
      anime(page: 1, perPage: \$perPage) {
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