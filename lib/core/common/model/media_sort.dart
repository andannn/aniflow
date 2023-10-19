/// Bangumi sort.
enum MediaSort {
  trending('TRENDING_DESC'),
  latestUpdate('UPDATED_AT_DESC');

  final String sqlTypeString;

  const MediaSort(this.sqlTypeString);
}
