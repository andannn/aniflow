import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:flutter/cupertino.dart';

enum ProfileTabType {
  favorite,
  animeList,
  mangaList,
  social,
  reviews;
}

extension ProfileTabTypeEx on ProfileTabType {
  String getLocalString(BuildContext context) => switch (this) {
        ProfileTabType.favorite => AFLocalizations.of(context).favorite,
        ProfileTabType.animeList => AFLocalizations.of(context).animeList,
        ProfileTabType.mangaList => AFLocalizations.of(context).mangaList,
        ProfileTabType.reviews => AFLocalizations.of(context).reviews,
        ProfileTabType.social => AFLocalizations.of(context).reviews,
      };
}
