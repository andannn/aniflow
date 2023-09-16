String createDetailAnimeQueryGraphQLString() {
  return '''
query (\$id: Int) {
  Media(id: \$id, type: ANIME) {
    id
    title {
      romaji
      english
      native
    }
    description(asHtml: true)
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
    characters(page: 1, perPage: 9, sort: FAVOURITES_DESC) {
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
