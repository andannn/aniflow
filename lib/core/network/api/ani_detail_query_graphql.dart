String createAnimeListQueryGraphQLString(int id) {
  return '''
query ($id: Int) {
  Media(id: $id, type: ANIME) {
    id
    title {
      romaji
      english
      native
    }
    description(asHtml: false)
    episodes
    source
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
      episode
      timeUntilAiring
    }
    characters(page: 5, perPage: 5, sort: FAVOURITES_DESC) {
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
          }
          name {
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
            full
            native
          }
        }
      }
    }
  }
}
''';
}
