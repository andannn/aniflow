
String get userFavoriteCharacterQueryGraphQl =>
'''
query(\$UserId: Int, \$page: Int, \$perPage: Int){
  User(id: \$UserId) {
    id
    name
    favourites(page: 1) {
      characters(page: \$page, perPage: \$perPage) {
        nodes {
          id
          image {
            large
            medium
          }
          name {
            first
            middle
            last
            full
            native
          }
        }
      }
    }
  }
}
''';