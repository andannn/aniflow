import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:flutter/cupertino.dart';

enum ProfileTabType {
  overview,
  favorite,
  animeList,
  mangaList,
  social,
}

extension ProfileTabTypeEx on ProfileTabType {
  String getLocalString(BuildContext context) => switch (this) {
        ProfileTabType.overview => 'Overview',
        ProfileTabType.favorite => AFLocalizations.of(context).favorite,
        ProfileTabType.animeList => AFLocalizations.of(context).animeList,
        ProfileTabType.mangaList => AFLocalizations.of(context).mangaList,
        ProfileTabType.social => AFLocalizations.of(context).social,
      };
}
