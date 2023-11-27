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
      userPreferred
    }
    image {
      medium
    }
    description(asHtml: false)
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