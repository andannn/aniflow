
enum FavoriteType {
  anime('favorite_anime'),
  manga('favorite_manga'),
  character('favorite_character'),
  staff('favorite_staff');

  const FavoriteType(this.contentValues);

  final String contentValues;
}


