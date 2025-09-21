// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get trendingNowLabel => 'トレンド';

  @override
  String get upComingNextSeasonLabel => '次のシーズンのアニメ';

  @override
  String get autumn => '秋';

  @override
  String get backgroundCharacter => 'サポート役';

  @override
  String get discover => '発見';

  @override
  String get login => 'ログイン';

  @override
  String get loginFailedMessage => 'ログインに失敗しました';

  @override
  String get loginSuccessMessage => 'ログイン成功！';

  @override
  String get logout => 'ログアウト';

  @override
  String get logoutSuccessMessage => 'ログアウトに成功しました!';

  @override
  String get movieLabel => '映画';

  @override
  String get retry => 'リトライ';

  @override
  String get spring => '春';

  @override
  String get summer => '夏';

  @override
  String get winter => '冬';

  @override
  String get animeCompleted => 'アニメ完成';

  @override
  String get animeDescription => 'このアニメについて';

  @override
  String get animeFinished => '完結';

  @override
  String get animeLabel => 'アニメ';

  @override
  String get animeList => 'アニメリスト';

  @override
  String get animeMarkWatched => 'アニメマーク視聴';

  @override
  String get animeNotYetReleased => '近日公開';

  @override
  String get animeReleasing => '放送中';

  @override
  String get characters => 'キャラクター';

  @override
  String get episodes => '話';

  @override
  String get favorite => 'お気に入り';

  @override
  String get lightNovelAnimation => 'ラノベ原作';

  @override
  String get mangaAnimation => '漫画原作';

  @override
  String get mangaList => 'マンガリスト';

  @override
  String get originalAnimation => 'オリジナル';

  @override
  String get otherAnimation => 'その他';

  @override
  String get reviews => 'レビュー';

  @override
  String get social => '社交';

  @override
  String get staff => 'スタッフ';

  @override
  String get topManhwa => 'トップマンガ';

  @override
  String get trailer => 'トレーラー';

  @override
  String get videoGameAnimation => 'テレビゲーム';

  @override
  String get visualNovelAnimation => 'ビジュアルノベル';

  @override
  String get allPageLoaded => 'すべてのページがロードされました';

  @override
  String get allTimePopular => '人気のアニメ';

  @override
  String get dataRefreshFailed => '同期失敗しました';

  @override
  String get mainCharacter => '主役';

  @override
  String get popularThisSeasonLabel => '今シーズンの人気アニメ';

  @override
  String get supportingCharacter => '脇役';

  @override
  String get averageScore => '平均スコア';

  @override
  String get newest => '最新';

  @override
  String get oldest => '最古';

  @override
  String get popularity => '人気';

  @override
  String get studio => 'スタジオ';

  @override
  String get trending => 'トレンド';

  @override
  String get user => 'ユーザー';

  @override
  String get mangaLabel => '漫画';

  @override
  String get activity => '活動';

  @override
  String get airing => '放送中';

  @override
  String get all => '全て';

  @override
  String get follows => 'フォロー';

  @override
  String get list => 'リスト';

  @override
  String get media => 'メディア';

  @override
  String get text => 'テキスト';

  @override
  String get cancelled => 'キャンセル';

  @override
  String get hiatus => '休止';

  @override
  String get english => '英語';

  @override
  String get french => 'フランス語';

  @override
  String get german => 'ドイツ語';

  @override
  String get hebrew => 'ヘブライ語';

  @override
  String get hungarian => 'ハンガリー語';

  @override
  String get italian => 'イタリア語';

  @override
  String get japanese => '日本語';

  @override
  String get korean => '韓国語';

  @override
  String get portuguese => 'ポルトガル語';

  @override
  String get spanish => 'スペイン語';

  @override
  String get schedule => '番組スケジュール';

  @override
  String get watchNow => '今見る';

  @override
  String get markWatched => '視聴済み';

  @override
  String get track => '追跡';

  @override
  String get scoring => 'スコアリング';

  @override
  String get externalLinks => '外部リンク &  ストリーミングリンク';

  @override
  String get relations => '関連するメディア';

  @override
  String get notification => '通知';

  @override
  String get status => '状態';

  @override
  String get toSearch => '検索ページへ';

  @override
  String get following => 'フォロー';

  @override
  String get global => 'グローバル';

  @override
  String get adaption => '改編';

  @override
  String get alternative => '別バージョン';

  @override
  String get other => 'その他';

  @override
  String get preQuel => '前編';

  @override
  String get sequel => '続編';

  @override
  String get sharedCharacter => '共通キャラクター';

  @override
  String get sideStory => 'サイドストーリー';

  @override
  String get spinOff => 'スピンオフ';

  @override
  String get summaryVersion => '概要版';

  @override
  String get restartAppHint => '設定を適用するにはアプリを再起動してください';

  @override
  String get joinNow => '今すぐ参加';

  @override
  String get welcomHint => 'お気に入りのアニメやマンガを追跡';

  @override
  String get stats => '統計';

  @override
  String get settings => '設定';

  @override
  String get days => '日';

  @override
  String get hours => '時間';

  @override
  String get minutes => '分';

  @override
  String nextEpToWatch(int episode) {
    return '次に見るエピソード: $episode話';
  }

  @override
  String nextAiringInfo(int nextEpisode, String durationUtilAir) {
    return '$nextEpisode話は$durationUtilAir後に放送予定';
  }

  @override
  String get connectionTimeOutMessage => '接続がタイムアウトしました。';

  @override
  String networkErrorMessage(int statusCode) {
    return 'ネットワークエラー（ステータスコード：$statusCode）。';
  }

  @override
  String get noNetworkMessage => 'ネットワークに接続されていません。';

  @override
  String get app => 'アプリ';

  @override
  String get about => 'アバウト';

  @override
  String get theme => 'テーマ';

  @override
  String get titleLanguage => 'タイトル言語';

  @override
  String get staffCharacterNameLanguage => 'スタッフ＆キャラクター名の言語';

  @override
  String get scoringSystem => 'スコアリングシステム';

  @override
  String get contents => 'コンテンツ';

  @override
  String get dark => 'ダーク';

  @override
  String get light => 'ライト';

  @override
  String get systemDefault => 'システムデフォルト';

  @override
  String get cantFindThisEpisode => 'このエピソードが見つかりません。';

  @override
  String get totalRewatches => '合計再視聴回数';

  @override
  String get startDate => '開始日';

  @override
  String get finishDate => '終了日';

  @override
  String get notes => 'ノート';

  @override
  String get current => '現在';

  @override
  String get paused => '一時停止';

  @override
  String get todayBirthdayCharacter => '誕生日のキャラクター';

  @override
  String animeSchedule(String date) {
    return '$dateのスケジュール';
  }

  @override
  String releaseDate(String date) {
    return '$date に公開されます。';
  }

  @override
  String releasedAt(String date) {
    return '$date に公開されました。';
  }

  @override
  String get movieSchedule => '映画の上映スケジュール';

  @override
  String get recentMovies => '最近の映画';

  @override
  String get progress => '進捗';

  @override
  String get newAired => '新規放送';

  @override
  String get hasNextEpisode => '次回あり';

  @override
  String get appUpgrade => 'アプリのアップグレード';

  @override
  String get upgrade => 'アップグレード';

  @override
  String get upgradeDialogDenyActionLabel => 'いいえ';

  @override
  String upgradeDialogMessage(String newVersion) {
    return 'アプリの新しいバージョン $newVersion が利用可能です。アップグレードしますか？';
  }

  @override
  String get checkForUpdate => 'アップグレード チェック';

  @override
  String get appUpToDate => 'アプリは最新です';

  @override
  String get currentVersion => '現在のバージョン';

  @override
  String clickToUpdate(String latestVersion) {
    return '最新バージョンは$latestVersionです。更新するにはクリックしてください！';
  }

  @override
  String get tutorialTitle => 'チュートリアル';

  @override
  String get longPressManageList => 'リストを管理するには長押ししてください';

  @override
  String get slideLeftMarkWatched => '左にスライドして視聴済みにマークする';

  @override
  String get gesture => 'ジェスチャー';

  @override
  String get watching => '見ている';

  @override
  String get planning => '計画している';

  @override
  String get completed => '完了';

  @override
  String get dropped => '中止';

  @override
  String get reading => '読んでいる';

  @override
  String get newAddedAnime => '新しく追加されたアニメ';

  @override
  String get newAddedManga => '新しく追加されたマンガ';

  @override
  String get experimental => '実験的';

  @override
  String get useInAppPlayer => 'アプリ内プレーヤーを使用';

  @override
  String get downloading => 'ダウンロード中';
}
