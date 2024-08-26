
import 'package:aniflow/core/network/api/media_content_graphql.dart';

String get userFavoriteQueryGraphQl =>
'''
query(\$UserId: Int){
  User(id: \$UserId) {
    id
    name
    favourites {
      anime {
        nodes {
          $mediaContentQueryGraphql
        }
      }
      manga {
        nodes {
          $mediaContentQueryGraphql
        }
      }
      characters {
        nodes {
          id
          image {
            large
            medium
          }
          name {
            first
            middle
            last
            full
            native
          }
        }
      }
      studios {
        nodes {
          id
          name
          isAnimationStudio
          siteUrl
          isFavourite
        }
      }
      staff {
        nodes {
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
  }
}
''';