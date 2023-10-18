String get staffPageGraphql =>
'''
query (\$id: Int, \$page: Int, \$perPage: Int) {
  Media(id: \$id, type: ANIME) {
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