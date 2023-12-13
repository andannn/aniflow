import 'package:aniflow/core/network/api/media_content_graphql.dart';

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
query(\$id: Int, \$page: Int, \$perPage: Int) {
  Studio(id: \$id) {
    media(page: \$page, perPage: \$perPage, sort: [START_DATE_DESC]) {
      $mediaConnectionQueryGraphql 
    }
  }
}
''';