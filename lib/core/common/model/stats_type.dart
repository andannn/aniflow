
enum StatsType {
  aimeGenres('Anime genres'),
  animeTags('Anime tags'),
  animeVoiceActors('Anime voice actors'),
  animeStudios('Anime studios'),
  animeStaff('Anime staff'),
  mangaGenres('Manga genres'),
  mangaTags('Manga tags'),
  mangaStaff('Manga staff');

  final String label;

  const StatsType(this.label);
}