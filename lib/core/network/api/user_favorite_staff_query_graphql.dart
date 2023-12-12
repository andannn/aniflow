
String get userFavoriteStaffQueryGraphQl =>
'''
query(\$UserId: Int, \$page: Int, \$perPage: Int){
  User(id: \$UserId) {
    id
    name
    favourites(page: 1) {
      staff(page: \$page, perPage: \$perPage) {
        nodes {
          id
          name {
            first
            middle
            last
            full
            native
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