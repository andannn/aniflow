// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get trendingNowLabel => 'Siendo tendencia ahora';

  @override
  String get upComingNextSeasonLabel => 'Próxima temporada';

  @override
  String get autumn => 'otoño';

  @override
  String get backgroundCharacter => 'Rol de soporte';

  @override
  String get discover => 'Descubrir';

  @override
  String get login => 'Acceso';

  @override
  String get loginFailedMessage => 'Error de inicio de sesión';

  @override
  String get loginSuccessMessage => '¡Acceso exitoso!';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get logoutSuccessMessage => '¡Cerrar sesión exitosamente!';

  @override
  String get movieLabel => 'Película';

  @override
  String get retry => 'Rever';

  @override
  String get spring => 'Primavera';

  @override
  String get summer => 'Verano';

  @override
  String get winter => 'Invierno';

  @override
  String get animeCompleted => 'Anime completado';

  @override
  String get animeDescription => 'Acerca de este anime';

  @override
  String get animeFinished => 'Finalizado';

  @override
  String get animeLabel => 'Animado';

  @override
  String get animeList => 'Lista de animes';

  @override
  String get animeMarkWatched => 'Marca de anime vista';

  @override
  String get animeNotYetReleased => 'Muy pronto';

  @override
  String get animeReleasing => 'Liberando';

  @override
  String get characters => 'Caracteres';

  @override
  String get episodes => 'episodios';

  @override
  String get favorite => 'Favorito';

  @override
  String get lightNovelAnimation => 'Novela ligera';

  @override
  String get mangaAnimation => 'Manga';

  @override
  String get mangaList => 'Lista de Mangas';

  @override
  String get originalAnimation => 'Original';

  @override
  String get otherAnimation => 'Otro';

  @override
  String get reviews => 'Reseñas';

  @override
  String get social => 'Social';

  @override
  String get staff => 'Personal';

  @override
  String get topManhwa => 'Manhwa superior';

  @override
  String get trailer => 'Remolque';

  @override
  String get videoGameAnimation => 'Videojuego';

  @override
  String get visualNovelAnimation => 'Novela visual';

  @override
  String get allPageLoaded => 'Toda la página está cargada.';

  @override
  String get allTimePopular => 'Popular de todos los tiempos';

  @override
  String get dataRefreshFailed => 'Error al actualizar los datos';

  @override
  String get mainCharacter => 'Principal';

  @override
  String get popularThisSeasonLabel => 'Popular esta temporada';

  @override
  String get supportingCharacter => 'Secundario';

  @override
  String get averageScore => 'Puntuación media';

  @override
  String get newest => 'El más nuevo';

  @override
  String get oldest => 'Más antiguo';

  @override
  String get popularity => 'Popularidad';

  @override
  String get studio => 'Estudio';

  @override
  String get trending => 'Tendencias';

  @override
  String get user => 'Usuario';

  @override
  String get mangaLabel => 'Manga';

  @override
  String get activity => 'Actividad';

  @override
  String get airing => 'Ventilación';

  @override
  String get all => 'Todo';

  @override
  String get follows => 'Sigue';

  @override
  String get list => 'Lista';

  @override
  String get media => 'Medios de comunicación';

  @override
  String get text => 'Texto';

  @override
  String get cancelled => 'Cancelado';

  @override
  String get hiatus => 'Hiato';

  @override
  String get english => 'Inglés';

  @override
  String get french => 'Francés';

  @override
  String get german => 'Alemán';

  @override
  String get hebrew => 'Hebreo';

  @override
  String get hungarian => 'Húngaro';

  @override
  String get italian => 'Italiano';

  @override
  String get japanese => 'Japonés';

  @override
  String get korean => 'Coreano';

  @override
  String get portuguese => 'Portugués';

  @override
  String get spanish => 'Español';

  @override
  String get schedule => 'Bangumi cronograma';

  @override
  String get watchNow => 'Ver ahora';

  @override
  String get markWatched => 'Observó';

  @override
  String get track => 'Pista';

  @override
  String get scoring => 'Puntuación';

  @override
  String get externalLinks => 'Enlaces externos y de streaming';

  @override
  String get relations => 'Medios relevantes para esto.';

  @override
  String get notification => 'Notificación';

  @override
  String get status => 'Estado';

  @override
  String get toSearch => 'A la página de búsqueda';

  @override
  String get following => 'Siguiente';

  @override
  String get global => 'Global';

  @override
  String get adaption => 'Adaptación';

  @override
  String get alternative => 'Versión alternativa';

  @override
  String get other => 'Otro';

  @override
  String get preQuel => 'Precuela';

  @override
  String get sequel => 'Continuación';

  @override
  String get sharedCharacter => 'Carácter compartido';

  @override
  String get sideStory => 'Historia paralela';

  @override
  String get spinOff => 'Escindir';

  @override
  String get summaryVersion => 'Versión resumida';

  @override
  String get restartAppHint =>
      'Reinicie la aplicación para aplicar la configuración';

  @override
  String get joinNow => 'Únete ahora';

  @override
  String get welcomHint => 'Sigue tu anime o manga favorito';

  @override
  String get stats => 'Estadísticas';

  @override
  String get settings => 'Ajustes';

  @override
  String get days => 'días';

  @override
  String get hours => 'horas';

  @override
  String get minutes => 'minutos';

  @override
  String nextEpToWatch(int episode) {
    return 'Siguiente a ver: Episodio $episode';
  }

  @override
  String nextAiringInfo(int nextEpisode, String durationUtilAir) {
    return 'El episodio $nextEpisode se emitirá en $durationUtilAir';
  }

  @override
  String get connectionTimeOutMessage => 'Tiempo de conexión agotado.';

  @override
  String networkErrorMessage(int statusCode) {
    return 'Error de red (código de estado: $statusCode).';
  }

  @override
  String get noNetworkMessage =>
      'se traduce al español como \"Sin conexión a la red.';

  @override
  String get app => 'Aplicación';

  @override
  String get about => 'Acerca de';

  @override
  String get theme => 'Tema';

  @override
  String get titleLanguage => 'Idioma del título';

  @override
  String get staffCharacterNameLanguage =>
      'Idioma de los nombres del personal y de los personajes';

  @override
  String get scoringSystem => 'Sistema de puntuación';

  @override
  String get contents => 'Contenidos';

  @override
  String get dark => 'Oscuro';

  @override
  String get light => 'Claro';

  @override
  String get systemDefault => 'Predeterminado del sistema';

  @override
  String get cantFindThisEpisode => 'No se puede encontrar este episodio.';

  @override
  String get totalRewatches => 'Reproducciones totales';

  @override
  String get startDate => 'Fecha de inicio';

  @override
  String get finishDate => 'Fecha de finalización';

  @override
  String get notes => 'Notas';

  @override
  String get current => 'Actual';

  @override
  String get paused => 'En pausa';

  @override
  String get todayBirthdayCharacter => 'Hoy es el cumpleaños del personaje';

  @override
  String animeSchedule(String date) {
    return 'Horario para $date';
  }

  @override
  String releaseDate(String date) {
    return 'Será lanzado el $date';
  }

  @override
  String releasedAt(String date) {
    return 'Estrenado el $date';
  }

  @override
  String get movieSchedule => 'Horario de películas';

  @override
  String get recentMovies => 'Películas recientes';

  @override
  String get progress => 'Progreso';

  @override
  String get newAired => 'Nuevo emitido';

  @override
  String get hasNextEpisode => 'Tiene próximo episodio';

  @override
  String get appUpgrade => 'Actualización de la aplicación';

  @override
  String get upgrade => 'ACTUALIZACIÓN';

  @override
  String get upgradeDialogDenyActionLabel => 'NO, GRACIAS';

  @override
  String upgradeDialogMessage(String newVersion) {
    return '¡Nueva versión $newVersion de la aplicación disponible!';
  }

  @override
  String get checkForUpdate => 'Buscar actualización';

  @override
  String get appUpToDate => 'La aplicación está actualizada';

  @override
  String get currentVersion => 'Versión actual';

  @override
  String clickToUpdate(String latestVersion) {
    return 'La última versión es $latestVersion, ¡haga clic para actualizar!';
  }

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get longPressManageList => 'Mantén presionado para gestionar tu lista';

  @override
  String get slideLeftMarkWatched =>
      'Desliza hacia la izquierda para marcar como visto';

  @override
  String get gesture => 'Gesto';

  @override
  String get watching => 'Viendo';

  @override
  String get planning => 'Planificando';

  @override
  String get completed => 'Completado';

  @override
  String get dropped => 'Dejado';

  @override
  String get reading => 'Leyendo';

  @override
  String get newAddedAnime => 'Nuevo Anime Añadido';

  @override
  String get newAddedManga => 'Nuevo Manga Añadido';

  @override
  String get experimental => 'Experimental';

  @override
  String get useInAppPlayer => 'Usar reproductor de la aplicación';

  @override
  String get downloading => 'Descargando';
}
