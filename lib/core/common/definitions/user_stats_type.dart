enum UserStatisticType {
  aimeGenres('Anime genres'),
  animeTags('Anime tags'),
  animeVoiceActors('Anime voice actors'),
  animeStudios('Anime studios'),
  animeStaff('Anime staff'),
  mangaGenres('Manga genres'),
  mangaTags('Manga tags'),
  mangaStaff('Manga staff');

  final String label;

  bool get isManga =>
      this == UserStatisticType.mangaGenres ||
      this == UserStatisticType.mangaTags ||
      this == UserStatisticType.mangaStaff;

  const UserStatisticType(this.label);
}
