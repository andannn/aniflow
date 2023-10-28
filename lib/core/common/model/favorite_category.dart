import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:flutter/material.dart';

enum FavoriteType {
  anime('favorite_anime'),
  manga('favorite_manga'),
  character('favorite_character'),
  staff('favorite_staff');

  const FavoriteType(this.contentValues);

  final String contentValues;
}

extension FavoriteTypeEx on FavoriteType {
  String getLocalString(BuildContext context) => switch (this) {
    FavoriteType.anime =>  AFLocalizations.of(context).animeLabel,
    FavoriteType.manga => AFLocalizations.of(context).mangaLabel,
    FavoriteType.character => AFLocalizations.of(context).characters,
    FavoriteType.staff => AFLocalizations.of(context).staff,
  };
}

