import 'package:aniflow/core/network/api/query_media_character_page_graphql.dart';

String get studioDetailQueryGraphQLString => '''
query (\$id: Int) {
  Studio(id: \$id) {
    id
    name
    isAnimationStudio
    siteUrl
    isFavourite
  }
}
''';

String get studioRelatedMediaQueryGraphQl => '''
query (\$id: Int, \$page: Int, \$perPage: Int) {
  Staff(id: \$id) {
    characterMedia(sort: START_DATE_DESC, page: \$page, perPage: \$perPage) {
      edges {
        id
        characters {
          $characterContentGraphql
        }
        characterRole
        node {
          id
          type
          format
          status
          season
          seasonYear
          coverImage {
            extraLarge
          }
          title {
            romaji
            english
            native
          }
          startDate {
            year
            month
            day
          }
          endDate {
            year
            month
            day
          }
        }
      }
    }
  }
}
''';