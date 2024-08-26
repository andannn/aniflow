
enum FavoriteType {
  anime('favorite_anime'),
  manga('favorite_manga'),
  character('favorite_character'),
  staff('favorite_staff'),
  studio('favorite_studio');

  const FavoriteType(this.contentValues);

  final String contentValues;
}


