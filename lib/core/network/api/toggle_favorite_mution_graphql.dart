class ToggleFavoriteMutationParam {
  final int? animeId;
  final int? mangaId;
  final int? characterId;
  final int? staffId;
  final int? studioId;

  ToggleFavoriteMutationParam(
      {this.animeId,
      this.mangaId,
      this.characterId,
      this.staffId,
      this.studioId});
}

String get toggleFavoriteMutationGraphQl => '''
mutation (\$animeId: Int, \$mangaId: Int, \$characterId: Int, \$staffId: Int, \$studioId: Int) {
  ToggleFavourite(animeId: \$animeId, mangaId: \$mangaId, characterId: \$characterId, staffId: \$staffId, studioId: \$studioId) {
    anime {
      edges {
        id
      }
    }
  }
}
''';
