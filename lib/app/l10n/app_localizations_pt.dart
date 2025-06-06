// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get trendingNowLabel => 'Tendências agora';

  @override
  String get upComingNextSeasonLabel => 'Próxima temporada';

  @override
  String get autumn => 'outono';

  @override
  String get backgroundCharacter => 'papel coadjuvante';

  @override
  String get discover => 'Descobrir';

  @override
  String get login => 'Conecte-se';

  @override
  String get loginFailedMessage => 'Falha no login';

  @override
  String get loginSuccessMessage => 'Login com sucesso!';

  @override
  String get logout => 'Sair';

  @override
  String get logoutSuccessMessage => 'Sucesso no logout!';

  @override
  String get movieLabel => 'Filme';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get spring => 'Primavera';

  @override
  String get summer => 'Verão';

  @override
  String get winter => 'Inverno';

  @override
  String get animeCompleted => 'Anime concluído';

  @override
  String get animeDescription => 'Sobre esse anime';

  @override
  String get animeFinished => 'Finalizado';

  @override
  String get animeLabel => 'Anime';

  @override
  String get animeList => 'Lista de animes';

  @override
  String get animeMarkWatched => 'Marca de anime assistida';

  @override
  String get animeNotYetReleased => 'Em breve';

  @override
  String get animeReleasing => 'Liberando';

  @override
  String get characters => 'Personagens';

  @override
  String get episodes => 'episódios';

  @override
  String get favorite => 'Favorito';

  @override
  String get lightNovelAnimation => 'Romance leve';

  @override
  String get mangaAnimation => 'MANGA';

  @override
  String get mangaList => 'Lista de mangás';

  @override
  String get originalAnimation => 'Original';

  @override
  String get otherAnimation => 'Outro';

  @override
  String get reviews => 'Avaliações';

  @override
  String get social => 'Social';

  @override
  String get staff => 'Funcionários';

  @override
  String get topManhwa => 'Melhor Manhwa';

  @override
  String get trailer => 'Reboque';

  @override
  String get videoGameAnimation => 'Videogame';

  @override
  String get visualNovelAnimation => 'Romance visual';

  @override
  String get allPageLoaded => 'Toda a página está carregada';

  @override
  String get allTimePopular => 'Popular de todos os tempos';

  @override
  String get dataRefreshFailed => 'Falha na atualização de dados';

  @override
  String get mainCharacter => 'Principal';

  @override
  String get popularThisSeasonLabel => 'Popular nesta temporada';

  @override
  String get supportingCharacter => 'Apoio';

  @override
  String get averageScore => 'Pontuação Média';

  @override
  String get newest => 'O mais novo';

  @override
  String get oldest => 'Mais antigo';

  @override
  String get popularity => 'Popularidade';

  @override
  String get studio => 'Estúdio';

  @override
  String get trending => 'Tendendo';

  @override
  String get user => 'Do utilizador';

  @override
  String get mangaLabel => 'MANGA';

  @override
  String get activity => 'Atividade';

  @override
  String get airing => 'Exibição';

  @override
  String get all => 'Todos';

  @override
  String get follows => 'Segue';

  @override
  String get list => 'Lista';

  @override
  String get media => 'Meios de comunicação';

  @override
  String get text => 'Texto';

  @override
  String get cancelled => 'Cancelado';

  @override
  String get hiatus => 'Hiato';

  @override
  String get english => 'Inglês';

  @override
  String get french => 'Francês';

  @override
  String get german => 'Alemão';

  @override
  String get hebrew => 'Hebraico';

  @override
  String get hungarian => 'Húngaro';

  @override
  String get italian => 'Italiano';

  @override
  String get japanese => 'Japonês';

  @override
  String get korean => 'Coreano';

  @override
  String get portuguese => 'Português';

  @override
  String get spanish => 'Espanhol';

  @override
  String get schedule => 'Bangumi agendar';

  @override
  String get watchNow => 'Assista agora';

  @override
  String get markWatched => 'Assistido';

  @override
  String get track => 'Acompanhar';

  @override
  String get scoring => 'Pontuação';

  @override
  String get externalLinks => 'Links externos e de streaming';

  @override
  String get relations => 'Mídias relevantes para isso';

  @override
  String get notification => 'Notificação';

  @override
  String get status => 'Status';

  @override
  String get toSearch => 'Para pesquisar na página';

  @override
  String get following => 'Seguindo';

  @override
  String get global => 'Global';

  @override
  String get adaption => 'Adaptação';

  @override
  String get alternative => 'Versão alternativa';

  @override
  String get other => 'Outro';

  @override
  String get preQuel => 'Prequela';

  @override
  String get sequel => 'Sequela';

  @override
  String get sharedCharacter => 'Personagem compartilhado';

  @override
  String get sideStory => 'História lateral';

  @override
  String get spinOff => 'Spin off';

  @override
  String get summaryVersion => 'Versão resumida';

  @override
  String get restartAppHint =>
      'Reinicie o aplicativo para aplicar a configuração';

  @override
  String get joinNow => 'Entrar';

  @override
  String get welcomHint => 'Acompanhe seu anime ou mangá favorito';

  @override
  String get stats => 'Estatisticas';

  @override
  String get settings => 'Configurações';

  @override
  String get days => 'dias';

  @override
  String get hours => 'horas';

  @override
  String get minutes => 'minutos';

  @override
  String nextEpToWatch(int episode) {
    return 'Próximo a assistir: Episódio $episode';
  }

  @override
  String nextAiringInfo(int nextEpisode, String durationUtilAir) {
    return 'O episódio $nextEpisode será transmitido em $durationUtilAir';
  }

  @override
  String get connectionTimeOutMessage => 'Tempo de conexão esgotado.';

  @override
  String networkErrorMessage(int statusCode) {
    return 'Erro de Rede (código de status: $statusCode).';
  }

  @override
  String get noNetworkMessage =>
      'traduzido para o português é \"Sem conexão de rede.';

  @override
  String get app => 'Aplicativo';

  @override
  String get about => 'Sobre';

  @override
  String get theme => 'Tema';

  @override
  String get titleLanguage => 'Idioma do título';

  @override
  String get staffCharacterNameLanguage =>
      'Idioma dos nomes do pessoal e dos personagens';

  @override
  String get scoringSystem => 'Sistema de pontuação';

  @override
  String get contents => 'Conteúdos';

  @override
  String get dark => 'Escuro';

  @override
  String get light => 'Claro';

  @override
  String get systemDefault => 'Padrão do sistema';

  @override
  String get cantFindThisEpisode => 'Não é possível encontrar este episódio.';

  @override
  String get totalRewatches => 'Total de visualizações repetidas';

  @override
  String get startDate => 'Data de início';

  @override
  String get finishDate => 'Data de conclusão';

  @override
  String get notes => 'Notas';

  @override
  String get current => 'Atual';

  @override
  String get paused => 'Pausado';

  @override
  String get todayBirthdayCharacter => 'Hoje é o aniversário do personagem';

  @override
  String animeSchedule(String date) {
    return 'Agenda para $date';
  }

  @override
  String releaseDate(String date) {
    return 'Será lançado em $date';
  }

  @override
  String releasedAt(String date) {
    return 'Lançado em $date';
  }

  @override
  String get movieSchedule => 'Horário de filmes';

  @override
  String get recentMovies => 'Filmes recentes';

  @override
  String get progress => 'Progresso';

  @override
  String get newAired => 'Recém-exibido';

  @override
  String get hasNextEpisode => 'Tem próximo episódio';

  @override
  String get appUpgrade => 'Atualização do aplicativo';

  @override
  String get upgrade => 'ATUALIZAÇÃO';

  @override
  String get upgradeDialogDenyActionLabel => 'NÃO, OBRIGADO';

  @override
  String upgradeDialogMessage(String newVersion) {
    return 'Uma nova versão $newVersion do aplicativo está disponível!';
  }

  @override
  String get checkForUpdate => 'ATUALIZAÇÃO';

  @override
  String get appUpToDate => 'O aplicativo está atualizado';

  @override
  String get currentVersion => 'Versão atual';

  @override
  String clickToUpdate(String latestVersion) {
    return 'A versão mais recente é $latestVersion, clique para atualizar!';
  }

  @override
  String get tutorialTitle => 'Tutorial';

  @override
  String get longPressManageList =>
      'Pressione e segure para gerenciar sua lista';

  @override
  String get slideLeftMarkWatched =>
      'Deslize para a esquerda para marcar como assistido';

  @override
  String get gesture => 'Gesto';

  @override
  String get watching => 'Assistindo';

  @override
  String get planning => 'Planejando';

  @override
  String get completed => 'Concluído';

  @override
  String get dropped => 'Abandonado';

  @override
  String get reading => 'Lendo';

  @override
  String get newAddedAnime => 'Novo Anime Adicionado';

  @override
  String get newAddedManga => 'Novo Manga Adicionado';

  @override
  String get experimental => 'Experimental';

  @override
  String get useInAppPlayer => 'Usar o player do aplicativo';

  @override
  String get downloading => 'Baixando';
}
