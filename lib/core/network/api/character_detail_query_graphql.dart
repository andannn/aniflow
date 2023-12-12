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