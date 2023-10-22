
String get userFavoriteCharacterQueryGraphQl =>
'''
query(\$UserId: Int, \$perPage: Int){
  User(id: \$UserId) {
    id
    name
    favourites(page: 1) {
      characters(page: 1, perPage: \$perPage) {
        nodes {
          id
          image {
            large
            medium
          }
          name {
            full
            native
          }
        }
      }
    }
  }
}
''';