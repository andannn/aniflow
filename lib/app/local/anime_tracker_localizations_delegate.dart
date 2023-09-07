
import 'package:anime_tracker/app/local/anime_tracker_localizations.dart';
import 'package:flutter/cupertino.dart';

class AnimeTrackerLocalizationsDelegate extends LocalizationsDelegate<AnimeTrackerLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'Jpan', 'ja', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<AnimeTrackerLocalizations> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'Jpan':
      case 'ja':
        return JaAnimeTrackerLocalizations();
      case 'zh':
        return CNAnimeTrackerLocalizations();
      default:
        return EnAnimeTrackerLocalizations();
    }
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AnimeTrackerLocalizations> old) {
    return false;
  }

}
