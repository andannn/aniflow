import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('nl'),
    Locale('pt'),
    Locale('ru'),
    Locale('zh')
  ];

  /// No description provided for @trendingNowLabel.
  ///
  /// In en, this message translates to:
  /// **'Trending now'**
  String get trendingNowLabel;

  /// No description provided for @upComingNextSeasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Upcoming next season'**
  String get upComingNextSeasonLabel;

  /// No description provided for @autumn.
  ///
  /// In en, this message translates to:
  /// **'autumn'**
  String get autumn;

  /// No description provided for @backgroundCharacter.
  ///
  /// In en, this message translates to:
  /// **'supporting role'**
  String get backgroundCharacter;

  /// No description provided for @discover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discover;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginFailedMessage.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailedMessage;

  /// No description provided for @loginSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Login success!'**
  String get loginSuccessMessage;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Logout success!'**
  String get logoutSuccessMessage;

  /// No description provided for @movieLabel.
  ///
  /// In en, this message translates to:
  /// **'Movie'**
  String get movieLabel;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @spring.
  ///
  /// In en, this message translates to:
  /// **'Spring'**
  String get spring;

  /// No description provided for @summer.
  ///
  /// In en, this message translates to:
  /// **'Summer'**
  String get summer;

  /// No description provided for @winter.
  ///
  /// In en, this message translates to:
  /// **'Winter'**
  String get winter;

  /// No description provided for @animeCompleted.
  ///
  /// In en, this message translates to:
  /// **'Anime completed'**
  String get animeCompleted;

  /// No description provided for @animeDescription.
  ///
  /// In en, this message translates to:
  /// **'About this anime'**
  String get animeDescription;

  /// No description provided for @animeFinished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get animeFinished;

  /// No description provided for @animeLabel.
  ///
  /// In en, this message translates to:
  /// **'Anime'**
  String get animeLabel;

  /// No description provided for @animeList.
  ///
  /// In en, this message translates to:
  /// **'Anime List'**
  String get animeList;

  /// No description provided for @animeMarkWatched.
  ///
  /// In en, this message translates to:
  /// **'Anime mark watched'**
  String get animeMarkWatched;

  /// No description provided for @animeNotYetReleased.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get animeNotYetReleased;

  /// No description provided for @animeReleasing.
  ///
  /// In en, this message translates to:
  /// **'Releasing'**
  String get animeReleasing;

  /// No description provided for @characters.
  ///
  /// In en, this message translates to:
  /// **'Characters'**
  String get characters;

  /// No description provided for @episodes.
  ///
  /// In en, this message translates to:
  /// **'episodes'**
  String get episodes;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @lightNovelAnimation.
  ///
  /// In en, this message translates to:
  /// **'Light novel'**
  String get lightNovelAnimation;

  /// No description provided for @mangaAnimation.
  ///
  /// In en, this message translates to:
  /// **'manga'**
  String get mangaAnimation;

  /// No description provided for @mangaList.
  ///
  /// In en, this message translates to:
  /// **'Manga List'**
  String get mangaList;

  /// No description provided for @originalAnimation.
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get originalAnimation;

  /// No description provided for @otherAnimation.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get otherAnimation;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @social.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get social;

  /// No description provided for @staff.
  ///
  /// In en, this message translates to:
  /// **'Staff'**
  String get staff;

  /// No description provided for @topManhwa.
  ///
  /// In en, this message translates to:
  /// **'Top Manhwa'**
  String get topManhwa;

  /// No description provided for @trailer.
  ///
  /// In en, this message translates to:
  /// **'Trailer'**
  String get trailer;

  /// No description provided for @videoGameAnimation.
  ///
  /// In en, this message translates to:
  /// **'Video game'**
  String get videoGameAnimation;

  /// No description provided for @visualNovelAnimation.
  ///
  /// In en, this message translates to:
  /// **'Visual Novel'**
  String get visualNovelAnimation;

  /// No description provided for @allPageLoaded.
  ///
  /// In en, this message translates to:
  /// **'All page is loaded'**
  String get allPageLoaded;

  /// No description provided for @allTimePopular.
  ///
  /// In en, this message translates to:
  /// **'All time popular'**
  String get allTimePopular;

  /// No description provided for @dataRefreshFailed.
  ///
  /// In en, this message translates to:
  /// **'Data refresh failed'**
  String get dataRefreshFailed;

  /// No description provided for @mainCharacter.
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get mainCharacter;

  /// No description provided for @popularThisSeasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Popular this season'**
  String get popularThisSeasonLabel;

  /// No description provided for @supportingCharacter.
  ///
  /// In en, this message translates to:
  /// **'Supporting'**
  String get supportingCharacter;

  /// No description provided for @averageScore.
  ///
  /// In en, this message translates to:
  /// **'Average Score'**
  String get averageScore;

  /// No description provided for @newest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get newest;

  /// No description provided for @oldest.
  ///
  /// In en, this message translates to:
  /// **'Oldest'**
  String get oldest;

  /// No description provided for @popularity.
  ///
  /// In en, this message translates to:
  /// **'Popularity'**
  String get popularity;

  /// No description provided for @studio.
  ///
  /// In en, this message translates to:
  /// **'Studio'**
  String get studio;

  /// No description provided for @trending.
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get trending;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @mangaLabel.
  ///
  /// In en, this message translates to:
  /// **'Manga'**
  String get mangaLabel;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @airing.
  ///
  /// In en, this message translates to:
  /// **'Airing'**
  String get airing;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @follows.
  ///
  /// In en, this message translates to:
  /// **'Follows'**
  String get follows;

  /// No description provided for @list.
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get list;

  /// No description provided for @media.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get media;

  /// No description provided for @text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get text;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get cancelled;

  /// No description provided for @hiatus.
  ///
  /// In en, this message translates to:
  /// **'Hiatus'**
  String get hiatus;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @german.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get german;

  /// No description provided for @hebrew.
  ///
  /// In en, this message translates to:
  /// **'Hebrew'**
  String get hebrew;

  /// No description provided for @hungarian.
  ///
  /// In en, this message translates to:
  /// **'Hungarian'**
  String get hungarian;

  /// No description provided for @italian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get italian;

  /// No description provided for @japanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get japanese;

  /// No description provided for @korean.
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get korean;

  /// No description provided for @portuguese.
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get portuguese;

  /// No description provided for @spanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'bangumi schedule'**
  String get schedule;

  /// No description provided for @watchNow.
  ///
  /// In en, this message translates to:
  /// **'Watch now'**
  String get watchNow;

  /// No description provided for @markWatched.
  ///
  /// In en, this message translates to:
  /// **'Watched'**
  String get markWatched;

  /// No description provided for @track.
  ///
  /// In en, this message translates to:
  /// **'Track'**
  String get track;

  /// No description provided for @scoring.
  ///
  /// In en, this message translates to:
  /// **'Scoring'**
  String get scoring;

  /// No description provided for @externalLinks.
  ///
  /// In en, this message translates to:
  /// **'External & Streaming links'**
  String get externalLinks;

  /// No description provided for @relations.
  ///
  /// In en, this message translates to:
  /// **'Medias relevant to this'**
  String get relations;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @toSearch.
  ///
  /// In en, this message translates to:
  /// **'To search page'**
  String get toSearch;

  /// No description provided for @following.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get following;

  /// No description provided for @global.
  ///
  /// In en, this message translates to:
  /// **'Global'**
  String get global;

  /// No description provided for @adaption.
  ///
  /// In en, this message translates to:
  /// **'Adaption'**
  String get adaption;

  /// No description provided for @alternative.
  ///
  /// In en, this message translates to:
  /// **'Alternative version'**
  String get alternative;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @preQuel.
  ///
  /// In en, this message translates to:
  /// **'Prequel'**
  String get preQuel;

  /// No description provided for @sequel.
  ///
  /// In en, this message translates to:
  /// **'Sequel'**
  String get sequel;

  /// No description provided for @sharedCharacter.
  ///
  /// In en, this message translates to:
  /// **'Shared character'**
  String get sharedCharacter;

  /// No description provided for @sideStory.
  ///
  /// In en, this message translates to:
  /// **'Side story'**
  String get sideStory;

  /// No description provided for @spinOff.
  ///
  /// In en, this message translates to:
  /// **'Spin off'**
  String get spinOff;

  /// No description provided for @summaryVersion.
  ///
  /// In en, this message translates to:
  /// **'Summary version'**
  String get summaryVersion;

  /// No description provided for @restartAppHint.
  ///
  /// In en, this message translates to:
  /// **'Restart App to apply setting'**
  String get restartAppHint;

  /// No description provided for @joinNow.
  ///
  /// In en, this message translates to:
  /// **'Join now'**
  String get joinNow;

  /// No description provided for @welcomHint.
  ///
  /// In en, this message translates to:
  /// **'Track your favorite anime or manga'**
  String get welcomHint;

  /// No description provided for @stats.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get stats;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get hours;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @nextEpToWatch.
  ///
  /// In en, this message translates to:
  /// **'Next to watch: Episode {episode}'**
  String nextEpToWatch(int episode);

  /// No description provided for @nextAiringInfo.
  ///
  /// In en, this message translates to:
  /// **'Episode {nextEpisode} will air in {durationUtilAir}'**
  String nextAiringInfo(int nextEpisode, String durationUtilAir);

  /// No description provided for @connectionTimeOutMessage.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout.'**
  String get connectionTimeOutMessage;

  /// No description provided for @networkErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Network Error (status code: {statusCode}).'**
  String networkErrorMessage(int statusCode);

  /// No description provided for @noNetworkMessage.
  ///
  /// In en, this message translates to:
  /// **'No network connection.'**
  String get noNetworkMessage;

  /// No description provided for @app.
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get app;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @titleLanguage.
  ///
  /// In en, this message translates to:
  /// **'Title Language'**
  String get titleLanguage;

  /// No description provided for @staffCharacterNameLanguage.
  ///
  /// In en, this message translates to:
  /// **'Staff & Character Name Language'**
  String get staffCharacterNameLanguage;

  /// No description provided for @scoringSystem.
  ///
  /// In en, this message translates to:
  /// **'Scoring System'**
  String get scoringSystem;

  /// No description provided for @contents.
  ///
  /// In en, this message translates to:
  /// **'Contents'**
  String get contents;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get systemDefault;

  /// No description provided for @cantFindThisEpisode.
  ///
  /// In en, this message translates to:
  /// **'Can\\\'t find this episode.'**
  String get cantFindThisEpisode;

  /// No description provided for @totalRewatches.
  ///
  /// In en, this message translates to:
  /// **'Total Rewatches'**
  String get totalRewatches;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get startDate;

  /// No description provided for @finishDate.
  ///
  /// In en, this message translates to:
  /// **'Finish Date'**
  String get finishDate;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @current.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get current;

  /// No description provided for @paused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get paused;

  /// No description provided for @todayBirthdayCharacter.
  ///
  /// In en, this message translates to:
  /// **'Characters with a birthday today'**
  String get todayBirthdayCharacter;

  /// No description provided for @animeSchedule.
  ///
  /// In en, this message translates to:
  /// **'{date}\'s schedule'**
  String animeSchedule(String date);

  /// The release date of the movie
  ///
  /// In en, this message translates to:
  /// **'Will be released on {date}'**
  String releaseDate(String date);

  /// The release date and time of the movie
  ///
  /// In en, this message translates to:
  /// **'Released at {date}'**
  String releasedAt(String date);

  /// No description provided for @movieSchedule.
  ///
  /// In en, this message translates to:
  /// **'Movie schedule'**
  String get movieSchedule;

  /// No description provided for @recentMovies.
  ///
  /// In en, this message translates to:
  /// **'Recent movies'**
  String get recentMovies;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @newAired.
  ///
  /// In en, this message translates to:
  /// **'New aired'**
  String get newAired;

  /// No description provided for @hasNextEpisode.
  ///
  /// In en, this message translates to:
  /// **'Has next episode'**
  String get hasNextEpisode;

  /// No description provided for @appUpgrade.
  ///
  /// In en, this message translates to:
  /// **'App upgrade'**
  String get appUpgrade;

  /// No description provided for @upgrade.
  ///
  /// In en, this message translates to:
  /// **'UPGRADE'**
  String get upgrade;

  /// No description provided for @upgradeDialogDenyActionLabel.
  ///
  /// In en, this message translates to:
  /// **'NO, THANKS'**
  String get upgradeDialogDenyActionLabel;

  /// No description provided for @upgradeDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'Version {newVersion} is available.\nWould you like to upgrade now?'**
  String upgradeDialogMessage(String newVersion);

  /// No description provided for @checkForUpdate.
  ///
  /// In en, this message translates to:
  /// **'Check for update'**
  String get checkForUpdate;

  /// No description provided for @appUpToDate.
  ///
  /// In en, this message translates to:
  /// **'App is up to date'**
  String get appUpToDate;

  /// No description provided for @currentVersion.
  ///
  /// In en, this message translates to:
  /// **'Current version'**
  String get currentVersion;

  /// No description provided for @clickToUpdate.
  ///
  /// In en, this message translates to:
  /// **'Latest version is {latestVersion}, click to update!'**
  String clickToUpdate(String latestVersion);

  /// No description provided for @tutorialTitle.
  ///
  /// In en, this message translates to:
  /// **'Tutorial'**
  String get tutorialTitle;

  /// No description provided for @longPressManageList.
  ///
  /// In en, this message translates to:
  /// **'Long press to manage your list'**
  String get longPressManageList;

  /// No description provided for @slideLeftMarkWatched.
  ///
  /// In en, this message translates to:
  /// **'Slide left to mark as watched'**
  String get slideLeftMarkWatched;

  /// No description provided for @gesture.
  ///
  /// In en, this message translates to:
  /// **'Gesture'**
  String get gesture;

  /// No description provided for @watching.
  ///
  /// In en, this message translates to:
  /// **'Watching'**
  String get watching;

  /// No description provided for @planning.
  ///
  /// In en, this message translates to:
  /// **'Planning'**
  String get planning;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @dropped.
  ///
  /// In en, this message translates to:
  /// **'Dropped'**
  String get dropped;

  /// No description provided for @reading.
  ///
  /// In en, this message translates to:
  /// **'Reading'**
  String get reading;

  /// No description provided for @newAddedAnime.
  ///
  /// In en, this message translates to:
  /// **'New Added Anime'**
  String get newAddedAnime;

  /// No description provided for @newAddedManga.
  ///
  /// In en, this message translates to:
  /// **'New Added Manga'**
  String get newAddedManga;

  /// No description provided for @experimental.
  ///
  /// In en, this message translates to:
  /// **'Experimental'**
  String get experimental;

  /// No description provided for @useInAppPlayer.
  ///
  /// In en, this message translates to:
  /// **'Use in-app-player'**
  String get useInAppPlayer;

  /// No description provided for @downloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading'**
  String get downloading;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'it',
        'ja',
        'nl',
        'pt',
        'ru',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'nl':
      return AppLocalizationsNl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
