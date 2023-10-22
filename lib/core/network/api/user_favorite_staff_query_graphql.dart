
String get userFavoriteStaffQueryGraphQl =>
'''
query(\$UserId: Int, \$perPage: Int){
  User(id: \$UserId) {
    id
    name
    favourites(page: 1) {
      staff(page: 1, perPage: \$perPage) {
        nodes {
          id
          name {
            full
            native
            userPreferred
          }
          image {
            large
            medium
          }
        }
      }
    }
  }
}
''';