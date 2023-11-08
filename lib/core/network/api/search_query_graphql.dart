
import 'package:aniflow/core/network/api/media_content_graphql.dart';

String get searchQueryGraphql =>
'''
query (\$page: Int, \$perPage: Int, \$search: String, \$type: MediaType) {
  page: Page(page: \$page, perPage: \$perPage) {
    media(type: \$type, sort: [POPULARITY_DESC], search: \$search) {
      $mediaContentQueryGraphql
    }
  }
}
''';
