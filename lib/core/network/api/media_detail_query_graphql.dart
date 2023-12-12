import 'package:aniflow/core/network/api/media_content_graphql.dart';

String get mediaDetailQueryGraphQLString =>
'''
query (\$id: Int) {
  Media(id: \$id) {
    id
    title {
      romaji
      english
      native
    }
    type
    description(asHtml: false)
    episodes
    seasonYear
    season
    source
    genres
    status
    hashtag
    isFavourite
    externalLinks {
      id
      url
      site
      type
      siteId
      color
      icon
    }
    rankings {
      rank
      type
      allTime
    }
    trailer {
      id
      site
      thumbnail
    }
    coverImage {
      extraLarge
      large
      medium
      color
    }
    bannerImage
    averageScore
    favourites
    trending
    isFavourite
    nextAiringEpisode {
      id
      airingAt
      episode
      timeUntilAiring
    }
    characters(page: 1, perPage: 9, sort: RELEVANCE) {
      pageInfo {
        total
        perPage
        currentPage
        lastPage
        hasNextPage
      }
      edges {
        role
        node {
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
        voiceActors(language: JAPANESE, sort: LANGUAGE) {
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
    }
    staff(page: 1, perPage: 9, sort: FAVOURITES_DESC) {
      pageInfo {
        total
        perPage
        currentPage
        lastPage
        hasNextPage
      }
      edges {
        role
        node {
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
    relations {
      $mediaConnectionQueryGraphql
    }
  }
}
''';
