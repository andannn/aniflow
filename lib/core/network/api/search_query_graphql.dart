
import 'package:aniflow/core/network/api/media_content_graphql.dart';
import 'package:aniflow/core/network/api/query_media_character_page_graphql.dart';
import 'package:aniflow/core/network/api/user_content_graphql.dart';

String get searchMediaQueryGraphql =>
'''
query (\$page: Int, \$perPage: Int, \$search: String, \$type: MediaType) {
  page: Page(page: \$page, perPage: \$perPage) {
    media(type: \$type, search: \$search) {
      $mediaContentQueryGraphql
    }
  }
}
''';

String get searchCharacterQueryGraphql =>
'''
query (\$page: Int, \$perPage: Int, \$search: String) {
  page: Page(page: \$page, perPage: \$perPage) {
    characters(search: \$search) {
      $characterContentGraphql
    }
  }
}
''';

String get searchStaffQueryGraphql =>
'''
query (\$page: Int, \$perPage: Int, \$search: String) {
  page: Page(page: \$page, perPage: \$perPage) {
    staff(search: \$search) {
      id
      name {
        first
        middle
        last
        full
        native
      }
      image {
        large
        medium
      }
    }
  }
}
''';

String get searchStudioQueryGraphql =>
'''
query (\$page: Int, \$perPage: Int, \$search: String) {
  page: Page(page: \$page, perPage: \$perPage) {
    studios(search: \$search) {
      id
      name
      isAnimationStudio
      siteUrl
      isFavourite
    }
  }
}
''';

String get searchUserQueryGraphql =>
'''
query (\$page: Int, \$perPage: Int, \$search: String) {
  page: Page(page: \$page, perPage: \$perPage) {
    users(search: \$search) {
      $userContentQueryGraphql
    }
  }
}
''';