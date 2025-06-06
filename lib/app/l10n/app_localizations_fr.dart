// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get trendingNowLabel => 'À la mode maintenant';

  @override
  String get upComingNextSeasonLabel => 'A venir la saison prochaine';

  @override
  String get autumn => 'automne';

  @override
  String get backgroundCharacter => 'rôle de soutien';

  @override
  String get discover => 'Découvrir';

  @override
  String get login => 'Se connecter';

  @override
  String get loginFailedMessage => 'La connexion a échoué';

  @override
  String get loginSuccessMessage => 'Connexion réussie !';

  @override
  String get logout => 'Se déconnecter';

  @override
  String get logoutSuccessMessage => 'Déconnexion réussie !';

  @override
  String get movieLabel => 'Film';

  @override
  String get retry => 'Recommencez';

  @override
  String get spring => 'Printemps';

  @override
  String get summer => 'Été';

  @override
  String get winter => 'Hiver';

  @override
  String get animeCompleted => 'Anime terminé';

  @override
  String get animeDescription => 'À propos de cet animé';

  @override
  String get animeFinished => 'Fini';

  @override
  String get animeLabel => 'Anime';

  @override
  String get animeList => 'Liste des animés';

  @override
  String get animeMarkWatched => 'Marque d\'anime regardée';

  @override
  String get animeNotYetReleased => 'À venir';

  @override
  String get animeReleasing => 'Libération';

  @override
  String get characters => 'Personnages';

  @override
  String get episodes => 'épisodes';

  @override
  String get favorite => 'Préféré';

  @override
  String get lightNovelAnimation => 'Roman léger';

  @override
  String get mangaAnimation => 'Mangas';

  @override
  String get mangaList => 'Liste des mangas';

  @override
  String get originalAnimation => 'Original';

  @override
  String get otherAnimation => 'Autre';

  @override
  String get reviews => 'Commentaires';

  @override
  String get social => 'Sociale';

  @override
  String get staff => 'Personnel';

  @override
  String get topManhwa => 'Haut Manhwa';

  @override
  String get trailer => 'Bande-annonce';

  @override
  String get videoGameAnimation => 'Jeu vidéo';

  @override
  String get visualNovelAnimation => 'Roman visuel';

  @override
  String get allPageLoaded => 'Toute la page est chargée';

  @override
  String get allTimePopular => 'Populaire de tous les temps';

  @override
  String get dataRefreshFailed => 'Échec de l\'actualisation des données';

  @override
  String get mainCharacter => 'Principal';

  @override
  String get popularThisSeasonLabel => 'Populaire cette saison';

  @override
  String get supportingCharacter => 'Justificatif';

  @override
  String get averageScore => 'Score moyen';

  @override
  String get newest => 'Le plus récent';

  @override
  String get oldest => 'Le plus ancien';

  @override
  String get popularity => 'Popularité';

  @override
  String get studio => 'Studio';

  @override
  String get trending => 'Tendance';

  @override
  String get user => 'Utilisateur';

  @override
  String get mangaLabel => 'Mangas';

  @override
  String get activity => 'Activité';

  @override
  String get airing => 'Aération';

  @override
  String get all => 'Tous';

  @override
  String get follows => 'Suit';

  @override
  String get list => 'Liste';

  @override
  String get media => 'Médias';

  @override
  String get text => 'Texte';

  @override
  String get cancelled => 'Annulé';

  @override
  String get hiatus => 'Hiatus';

  @override
  String get english => 'Anglais';

  @override
  String get french => 'Français';

  @override
  String get german => 'Allemand';

  @override
  String get hebrew => 'Hébreu';

  @override
  String get hungarian => 'Hongrois';

  @override
  String get italian => 'Italien';

  @override
  String get japanese => 'Japonais';

  @override
  String get korean => 'Coréen';

  @override
  String get portuguese => 'Portugais';

  @override
  String get spanish => 'Espagnol';

  @override
  String get schedule => 'Bangumi calendrier';

  @override
  String get watchNow => 'Regarde maintenant';

  @override
  String get markWatched => 'Regardé';

  @override
  String get track => 'Piste';

  @override
  String get scoring => 'Notation';

  @override
  String get externalLinks => 'Liens externes et streaming';

  @override
  String get relations => 'Médias pertinents à ce sujet';

  @override
  String get notification => 'Notification';

  @override
  String get status => 'Statut';

  @override
  String get toSearch => 'Vers la page de recherche';

  @override
  String get following => 'Suivant';

  @override
  String get global => 'Mondial';

  @override
  String get adaption => 'Adaptation';

  @override
  String get alternative => 'Version alternative';

  @override
  String get other => 'Autre';

  @override
  String get preQuel => 'Préquelle';

  @override
  String get sequel => 'Suite';

  @override
  String get sharedCharacter => 'Caractère partagé';

  @override
  String get sideStory => 'Histoire parallèle';

  @override
  String get spinOff => 'Spin off';

  @override
  String get summaryVersion => 'Version résumée';

  @override
  String get restartAppHint =>
      'Redémarrez l\'application pour appliquer le paramètre';

  @override
  String get joinNow => 'Adhérer maintenant';

  @override
  String get welcomHint => 'Suivez votre anime ou manga préféré';

  @override
  String get stats => 'Statistiques';

  @override
  String get settings => 'Paramètres';

  @override
  String get days => 'jours';

  @override
  String get hours => 'Heures';

  @override
  String get minutes => 'minutes';

  @override
  String nextEpToWatch(int episode) {
    return 'Prochain à regarder : Épisode $episode';
  }

  @override
  String nextAiringInfo(int nextEpisode, String durationUtilAir) {
    return 'L\'épisode $nextEpisode sera diffusé dans $durationUtilAir';
  }

  @override
  String get connectionTimeOutMessage => 'Délai de connexion dépassé.';

  @override
  String networkErrorMessage(int statusCode) {
    return 'Erreur réseau (code de statut : $statusCode).';
  }

  @override
  String get noNetworkMessage => 'Pas de connexion réseau.';

  @override
  String get app => 'Application';

  @override
  String get about => 'À propos de';

  @override
  String get theme => 'Thème';

  @override
  String get titleLanguage => 'Langue du titre';

  @override
  String get staffCharacterNameLanguage =>
      'Langue des noms du personnel et des personnages';

  @override
  String get scoringSystem => 'Système de notation';

  @override
  String get contents => 'Contenus';

  @override
  String get dark => 'Sombre';

  @override
  String get light => 'Clair';

  @override
  String get systemDefault => 'Défaut du système';

  @override
  String get cantFindThisEpisode => 'Impossible de trouver cet épisode.';

  @override
  String get totalRewatches => 'Relectures totales';

  @override
  String get startDate => 'Date de début';

  @override
  String get finishDate => 'Date de fin';

  @override
  String get notes => 'Notes';

  @override
  String get current => 'Actuel';

  @override
  String get paused => 'En pause';

  @override
  String get todayBirthdayCharacter =>
      'Aujourd\'hui, c\'est l\'anniversaire du personnage';

  @override
  String animeSchedule(String date) {
    return 'Emploi du temps pour $date';
  }

  @override
  String releaseDate(String date) {
    return 'Sortie prévue le $date';
  }

  @override
  String releasedAt(String date) {
    return 'Sorti le $date';
  }

  @override
  String get movieSchedule => 'Horaire des films';

  @override
  String get recentMovies => 'Films récents';

  @override
  String get progress => 'Progrès';

  @override
  String get newAired => 'Nouvellement diffusé';

  @override
  String get hasNextEpisode => 'A le prochain épisode';

  @override
  String get appUpgrade => 'Mise à niveau de l\'application';

  @override
  String get upgrade => 'MISE À NIVEAU';

  @override
  String get upgradeDialogDenyActionLabel => 'NON, MERCI';

  @override
  String upgradeDialogMessage(String newVersion) {
    return 'Une nouvelle version $newVersion de l\'application est disponible. Voulez-vous mettre à jour maintenant ?';
  }

  @override
  String get checkForUpdate => 'Vérifier la mise à jour';

  @override
  String get appUpToDate => 'L\'application est à jour';

  @override
  String get currentVersion => 'Version actuelle';

  @override
  String clickToUpdate(String latestVersion) {
    return 'La dernière version est $latestVersion, cliquez pour mettre à jour!';
  }

  @override
  String get tutorialTitle => 'Tutoriel';

  @override
  String get longPressManageList => 'Appui long pour gérer votre liste';

  @override
  String get slideLeftMarkWatched =>
      'Faites glisser vers la gauche pour marquer comme regardé';

  @override
  String get gesture => 'Geste';

  @override
  String get watching => 'Regardant';

  @override
  String get planning => 'Planifiant';

  @override
  String get completed => 'Terminé';

  @override
  String get dropped => 'Abandonné';

  @override
  String get reading => 'Lecture';

  @override
  String get newAddedAnime => 'Nouvel Anime Ajouté';

  @override
  String get newAddedManga => 'Nouveau Manga Ajouté';

  @override
  String get experimental => 'Expérimental';

  @override
  String get useInAppPlayer => 'Utiliser le lecteur intégré';

  @override
  String get downloading => 'Téléchargement';
}
