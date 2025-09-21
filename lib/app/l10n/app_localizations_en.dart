import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get trendingNowLabel => 'Trending now';

  @override
  String get upComingNextSeasonLabel => 'Upcoming next season';

  @override
  String get autumn => 'autumn';

  @override
  String get backgroundCharacter => 'supporting role';

  @override
  String get discover => 'Discover';

  @override
  String get login => 'Login';

  @override
  String get loginFailedMessage => 'Login failed';

  @override
  String get loginSuccessMessage => 'Login success!';

  @override
  String get logout => 'Logout';

  @override
  String get logoutSuccessMessage => 'Logout success!';

  @override
  String get movieLabel => 'Movie';

  @override
  String get retry => 'Retry';

  @override
  String get spring => 'Spring';

  @override
  String get summer => 'Summer';

  @override
  String get winter => 'Winter';

  @override
  String get animeCompleted => 'Anime completed';

  @override
  String get animeDescription => 'About this anime';

  @override
  String get animeFinished => 'Finished';

  @override
  String get animeLabel => 'Anime';

  @override
  String get animeList => 'Anime List';

  @override
  String get animeMarkWatched => 'Anime mark watched';

  @override
  String get animeNotYetReleased => 'Coming soon';

  @override
  String get animeReleasing => 'Releasing';

  @override
  String get characters => 'Characters';

  @override
  String get episodes => 'episodes';

  @override
  String get favorite => 'Favorite';

  @override
  String get lightNovelAnimation => 'Light novel';

  @override
  String get mangaAnimation => 'manga';

  @override
  String get mangaList => 'Manga List';

  @override
  String get originalAnimation => 'Original';

  @override
  String get otherAnimation => 'Other';

  @override
  String get reviews => 'Reviews';

  @override
  String get social => 'Social';

  @override
  String get staff => 'Staff';

  @override
  String get topManhwa => 'Top Manhwa';

  @override
  String get trailer => 'Trailer';

  @override
  String get videoGameAnimation => 'Video game';

  @override
  String get visualNovelAnimation => 'Visual Novel';

  @override
  String get allPageLoaded => 'All page is loaded';

  @override
  String get allTimePopular => 'All time popular';

  @override
  String get dataRefreshFailed => 'Data refresh failed';

  @override
  String get mainCharacter => 'Main';

  @override
  String get popularThisSeasonLabel => 'Popular this season';

  @override
  String get supportingCharacter => 'Supporting';

  @override
  String get averageScore => 'Average Score';

  @override
  String get newest => 'Newest';

  @override
  String get oldest => 'Oldest';

  @override
  String get popularity => 'Popularity';

  @override
  String get studio => 'Studio';

  @override
  String get trending => 'Trending';

  @override
  String get user => 'User';

  @override
  String get mangaLabel => 'Manga';

  @override
  String get activity => 'Activity';

  @override
  String get airing => 'Airing';

  @override
  String get all => 'All';

  @override
  String get follows => 'Follows';

  @override
  String get list => 'List';

  @override
  String get media => 'Media';

  @override
  String get text => 'Text';

  @override
  String get cancelled => 'Canceled';

  @override
  String get hiatus => 'Hiatus';

  @override
  String get english => 'English';

  @override
  String get french => 'French';

  @override
  String get german => 'German';

  @override
  String get hebrew => 'Hebrew';

  @override
  String get hungarian => 'Hungarian';

  @override
  String get italian => 'Italian';

  @override
  String get japanese => 'Japanese';

  @override
  String get korean => 'Korean';

  @override
  String get portuguese => 'Portuguese';

  @override
  String get spanish => 'Spanish';

  @override
  String get schedule => 'bangumi schedule';

  @override
  String get watchNow => 'Watch now';

  @override
  String get markWatched => 'Watched';

  @override
  String get track => 'Track';

  @override
  String get scoring => 'Scoring';

  @override
  String get externalLinks => 'External & Streaming links';

  @override
  String get relations => 'Medias relevant to this';

  @override
  String get notification => 'Notification';

  @override
  String get status => 'Status';

  @override
  String get toSearch => 'To search page';

  @override
  String get following => 'Following';

  @override
  String get global => 'Global';

  @override
  String get adaption => 'Adaption';

  @override
  String get alternative => 'Alternative version';

  @override
  String get other => 'Other';

  @override
  String get preQuel => 'Prequel';

  @override
  String get sequel => 'Sequel';

  @override
  String get sharedCharacter => 'Shared character';

  @override
  String get sideStory => 'Side story';

  @override
  String get spinOff => 'Spin off';

  @override
  String get summaryVersion => 'Summary version';

  @override
  String get restartAppHint => 'Restart App to apply setting';

  @override
  String get joinNow => 'Join now';

  @override
  String get welcomHint => 'Track your favorite anime or manga';

  @override
  String get stats => 'Stats';

  @override
  String get settings => 'Settings';

  @override
  String get days => 'days';

  @override
  String get hours => 'hours';

  @override
  String get minutes => 'minutes';

  @override
  String nextEpToWatch(int episode) {
    return 'Next to watch: Episode $episode';
  }

  @override
  String nextAiringInfo(int nextEpisode, String durationUtilAir) {
    return 'Episode $nextEpisode will air in $durationUtilAir';
  }

  @override
  String get connectionTimeOutMessage => 'Connection timeout.';

  @override
  String networkErrorMessage(int statusCode) {
    return 'Network Error (status code: $statusCode).';
  }

  @override
  String get noNetworkMessage => 'No network connection.';

  @override
  String get app => 'App';

  @override
  String get about => 'About';

  @override
  String get theme => 'Theme';

  @override
  String get titleLanguage => 'Title Language';

  @override
  String get staffCharacterNameLanguage => 'Staff & Character Name Language';

  @override
  String get scoringSystem => 'Scoring System';

  @override
  String get contents => 'Contents';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get systemDefault => 'System default';

  @override
  String get cantFindThisEpisode => 'Can\\\'t find this episode.';

  @override
  String get totalRewatches => 'Total Rewatches';

  @override
  String get startDate => 'Start date';

  @override
  String get finishDate => 'Finish Date';

  @override
  String get notes => 'Notes';

  @override
  String get current => 'Current';

  @override
  String get paused => 'Paused';

  @override
  String get todayBirthdayCharacter => 'Characters with a birthday today';

  @override
  String animeSchedule(String date) {
    return '$date\'s schedule';
  }

  @override
  String releaseDate(String date) {
    return 'Will be released on $date';
  }

  @override
  String releasedAt(String date) {
    return 'Released at $date';
  }

  @override
  String get movieSchedule => 'Movie schedule';

  @override
  String get recentMovies => 'Recent movies';

  @override
  String get progress => 'Progress';

  @override
  String get newAired => 'New aired';

  @override
  String get hasNextEpisode => 'Has next episode';

  @override
  String get appUpgrade => 'App upgrade';

  @override
  String get upgrade => 'UPGRADE';

  @override
  String get upgradeDialogDenyActionLabel => 'NO, THANKS';

  @override
  String upgradeDialogMessage(String newVersion) {
    return 'Version $newVersion is available.\nWould you like to upgrade now?';
  }

  @override
  String get checkForUpdate => 'Check for update';

  @override
  String get appUpToDate => 'App is up to date';

  @override
  String get currentVersion => 'Current version';

  @override
  String clickToUpdate(String latestVersion) {
    return 'Latest version is $latestVersion, click to update!';
  }

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get longPressManageList => 'Long press to manage your list';

  @override
  String get slideLeftMarkWatched => 'Slide left to mark as watched';

  @override
  String get gesture => 'Gesture';

  @override
  String get watching => 'Watching';

  @override
  String get planning => 'Planning';

  @override
  String get completed => 'Completed';

  @override
  String get dropped => 'Dropped';

  @override
  String get reading => 'Reading';

  @override
  String get newAddedAnime => 'New Added Anime';

  @override
  String get newAddedManga => 'New Added Manga';

  @override
  String get experimental => 'Experimental';

  @override
  String get useInAppPlayer => 'Use in-app-player';

  @override
  String get downloading => 'Downloading';
}
