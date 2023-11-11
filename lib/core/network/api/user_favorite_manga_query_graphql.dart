
import 'package:aniflow/core/network/api/media_content_graphql.dart';

String get userFavoriteMangaQueryGraphQl =>
'''
query(\$UserId: Int, \$page: Int, \$perPage: Int){
  User(id: \$UserId) {
    id
    name
    favourites(page: 1) {
      manga(page: \$page, perPage: \$perPage) {
        nodes {
          $mediaContentQueryGraphql
        }
      }
    }
  }
}
''';