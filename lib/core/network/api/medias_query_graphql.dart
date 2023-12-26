import 'package:aniflow/core/network/api/media_content_graphql.dart';

String get mediasQueryGraphql => '''
query(\$id_in: [Int]) {
  Page(page: 1, perPage: 10) {
    media(id_in: \$id_in) {
      $mediaContentQueryGraphql
    }
  }
}
''';
