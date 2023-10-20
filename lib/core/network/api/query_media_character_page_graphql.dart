String get characterPageGraphql =>
'''
query (\$id: Int, \$page: Int, \$perPage: Int) {
  Media(id: \$id) {
    characters(page: \$page, perPage: \$perPage, sort: FAVOURITES_DESC) {
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
          image {
            large
            medium
          }
          name {
            full
            native
          }
        }
        voiceActors(language: JAPANESE, sort: LANGUAGE) {
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