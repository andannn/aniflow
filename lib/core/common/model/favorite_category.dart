enum FavoriteType {
  anime('favorite_anime'),
  manga('favorite_manga'),
  character('favorite_staff'),
  staff('favorite_character');

  const FavoriteType(this.contentValues);

  final String contentValues;
}
