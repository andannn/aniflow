import 'package:aniflow/core/network/api/media_content_graphql.dart';

String get characterDetailQueryGraphQLString => '''
query (\$id: Int) {
  Character(id: \$id) {
    id
    name {
      first
      middle
      last
      full
      native
    }
    image {
      medium
      large
    }
    description(asHtml: true)
    gender
    dateOfBirth {
      year
      month
      day
    }
    age
    bloodType
    isFavourite
    siteUrl
    favourites
    media {
      $mediaConnectionQueryGraphql
    }
  }
}
''';

String get birthdayCharacterPageQueryGraphQLString => '''
query(\$page: Int, \$perPage: Int) {
  page: Page(page: \$page, perPage: \$page) {
    characters(isBirthday: true, sort: [FAVOURITES_DESC]) {
      id
      name {
        first
        middle
        last
        full
        native
      }
      image {
        medium
        large
      }
      dateOfBirth {
        year
        month
        day
      }
      isFavourite
      media(page: 1, perPage: 1, sort: [POPULARITY_DESC]) {
        $mediaConnectionQueryGraphql
      }
    }
  }
}
''';
