import 'package:aniflow/core/network/api/query_media_character_page_graphql.dart';

String get staffDetailQueryGraphQLString => '''
query (\$id: Int) {
  Staff(id: \$id) {
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
    description(asHtml: true)
    gender
    dateOfBirth {
      year
      month
      day
    }
    dateOfDeath {
      year
      month
      day
    }
    age
    yearsActive
    homeTown
    bloodType
    isFavourite
    siteUrl
  }
}
''';

String get staffRelatedCharacterQueryGraphQl => '''
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