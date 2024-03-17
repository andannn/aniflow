/// Anime format
enum AnimeFormat {
  tv(['TV', 'TV_SHORT']),
  movie(['MOVIE']),
  ova(['OVA', 'SPECIAL', 'ONA']);

  final List<String> sqlTypeString;

  const AnimeFormat(this.sqlTypeString);
}