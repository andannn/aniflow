String get characterPageGraphql =>
'''
query (\$id: Int, \$page: Int, \$perPage: Int, \$staffLanguage: StaffLanguage) {
  Media(id: \$id) {
    characters(page: \$page, perPage: \$perPage, sort: RELEVANCE) {
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
          $characterContentGraphql
        }
        voiceActors(language: \$staffLanguage, sort: LANGUAGE) {
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

String get characterContentGraphql => '''
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
''';
