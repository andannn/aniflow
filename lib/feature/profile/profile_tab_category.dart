import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:flutter/cupertino.dart';

enum ProfileTabType {
  favorite,
  activity,
  animeList,
  mangaList,
  stats,
}

extension ProfileTabTypeEx on ProfileTabType {
  String getLocalString(BuildContext context) => switch (this) {
        ProfileTabType.activity => 'Activity',
        ProfileTabType.favorite => AFLocalizations.of(context).favorite,
        ProfileTabType.animeList => AFLocalizations.of(context).animeList,
        ProfileTabType.mangaList => AFLocalizations.of(context).mangaList,
        ProfileTabType.stats => 'Stats',
      };
}
