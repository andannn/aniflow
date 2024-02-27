import 'package:aniflow/core/network/api/media_content_graphql.dart';
import 'package:aniflow/core/network/api/user_content_graphql.dart';

String get activitiesDetailGraphQLString => '''
query (\$id: Int) {
  Activity(id: \$id) {
    $_activityUnionContentString
  }
}

''';

String get _activityUnionContentString => '''
      __typename
      ... on TextActivity {
        id
        $_activityReply
        text(asHtml: true)
        userId
        type
        replyCount
        siteUrl
        isLocked
        isLiked
        likeCount
        isPinned
        createdAt
        user {
          $userContentQueryGraphql
        }
      }
      ... on ListActivity {
        id
        $_activityReply
        status
        progress
        userId
        type
        replyCount
        siteUrl
        isLocked
        isLiked
        likeCount
        isPinned
        createdAt
        user {
          $userContentQueryGraphql
        }
        media {
          $mediaContentQueryGraphql
        }
      }
''';

String get _activityReply => '''
      replies {
        id
        user {
          $userContentQueryGraphql
        }
        likeCount
        text
        isLiked
        createdAt
      }
''';
