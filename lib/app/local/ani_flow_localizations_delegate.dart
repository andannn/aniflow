
import 'package:anime_tracker/app/local/ani_flow_localizations.dart';
import 'package:flutter/cupertino.dart';

class AnimeTrackerLocalizationsDelegate extends LocalizationsDelegate<AFLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'Jpan', 'ja', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<AFLocalizations> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'Jpan':
      case 'ja':
        return JaAniFLowLocalizations();
      case 'zh':
        return CNAniFlowLocalizations();
      default:
        return EnAniFlowLocalizations();
    }
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AFLocalizations> old) {
    return false;
  }

}
