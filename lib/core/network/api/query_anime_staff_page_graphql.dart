String get staffPageGraphql =>
'''
query (\$id: Int, \$page: Int, \$perPage: Int) {
  Media(id: \$id) {
    staff(page: \$page, perPage: \$perPage, sort: FAVOURITES_DESC) {
      pageInfo {
        total
        perPage
        currentPage
        lastPage
        hasNextPage
      }
      edges {
        role
        node {
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