/// Bangumi sort.
enum AnimeSort {
  trending('TRENDING_DESC'),
  latestUpdate('UPDATED_AT_DESC');

  final String sqlTypeString;

  const AnimeSort(this.sqlTypeString);
}
