import 'package:aniflow/app/app.dart';
import 'package:aniflow/core/common/definitions/media_sort.dart';
import 'package:aniflow/feature/anime_search/bloc/search_type.dart';
import 'package:flutter/material.dart';

abstract class AFLocalizations {
  String get trendingNowLabel;

  String get movieLabel;

  String get popularThisSeasonLabel;

  String get upComingNextSeasonLabel;

  String get discover;

  String get login;

  String get logout;

  String get logoutSuccessMessage;

  String get loginSuccessMessage;

  String get loginFailedMessage;

  String get dataRefreshed;

  String get dataRefreshFailed;

  String get allPageLoaded;

  String get retry;

  String get spring;

  String get summer;

  String get fail;

  String get winter;

  String get mainCharacter;

  String get supportingCharacter;

  String get backgroundCharacter;

  String get animeDescription;

  String get characters;

  String get trailer;

  String get originalAnimation;

  String get mangaAnimation;

  String get lightNovelAnimation;

  String get visualNovelAnimation;

  String get videoGameAnimation;

  String get otherAnimation;

  String get episodes;

  String get animeReleasing;

  String get animeFinished;

  String get animeNotYetReleased;

  String get followNewAnimation;

  String get dropAnimation;

  String get animeCompleted;

  String get animeMarkWatched;

  String get staff;

  String get allTimePopular;

  String get topManhwa;

  String get favorite;

  String get animeList;

  String get mangaList;

  String get reviews;

  String get social;

  String get animeLabel;

  String get mangaLabel;

  String getMediaSortString(MediaSort sort);

  String getSearchTypeString(SearchType type);

  static AFLocalizations of([BuildContext? context]) {
    if (context == null && globalContext == null) {
      return JaAniFLowLocalizations();
    }

    return Localizations.of<AFLocalizations>(
        context ?? globalContext!, AFLocalizations)!;
  }
}

class EnAniFlowLocalizations extends AFLocalizations {
  @override
  String get trendingNowLabel => 'Trending now';

  @override
  String get upComingNextSeasonLabel => 'Upcoming next season';

  @override
  String get popularThisSeasonLabel => 'Popular this season';

  @override
  String get discover => 'Discover';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get loginSuccessMessage => 'Login success!';

  @override
  String get loginFailedMessage => 'Login failed';

  @override
  String get dataRefreshed => 'Anime data is synced!';

  @override
  String get logoutSuccessMessage => 'Logout success!';

  @override
  String get allPageLoaded => 'All page is loaded';

  @override
  String get dataRefreshFailed => 'Data refresh failed';

  @override
  String get retry => 'Retry';

  @override
  String get fail => 'Fail';

  @override
  String get spring => 'Spring';

  @override
  String get summer => 'Summer';

  @override
  String get winter => 'Winter';

  @override
  String get backgroundCharacter => 'Background';

  @override
  String get mainCharacter => 'Main';

  @override
  String get supportingCharacter => 'Supporting';

  @override
  String get animeDescription => 'About this anime';

  @override
  String get characters => 'Characters';

  @override
  String get trailer => 'Trailer';

  @override
  String get originalAnimation => 'Original';

  @override
  String get mangaAnimation => 'Manga';

  @override
  String get lightNovelAnimation => 'Light novel';

  @override
  String get otherAnimation => 'Other';

  @override
  String get videoGameAnimation => 'Video game';

  @override
  String get visualNovelAnimation => 'Visual Novel';

  @override
  String get episodes => 'episodes';

  @override
  String get animeFinished => 'Finished';

  @override
  String get animeNotYetReleased => 'Coming soon..';

  @override
  String get animeReleasing => 'Releasing';

  @override
  String get movieLabel => 'Movie';

  @override
  String get followNewAnimation => 'Follow new animation';

  @override
  String get dropAnimation => 'drop the animation';

  @override
  String get animeCompleted => 'anime completed';

  @override
  String get animeMarkWatched => 'Anime mark watched';

  @override
  String get staff => 'Staff';

  @override
  String get allTimePopular => 'All time popular';

  @override
  String get topManhwa => 'Top Manhwa';

  @override
  String get favorite => 'Favorite';

  @override
  String get animeList => 'Anime List';

  @override
  String get mangaList => 'Manga List';

  @override
  String get reviews => 'Reviews';

  @override
  String get animeLabel => 'Anime';

  @override
  String get mangaLabel => 'Manga';

  @override
  String get social => 'Social';

  @override
  String getMediaSortString(MediaSort sort) => switch(sort) {
    MediaSort.trending => 'Trending',
    MediaSort.newest => 'Newest',
    MediaSort.oldest => 'Oldest',
    MediaSort.averageScore => 'Average Score',
    MediaSort.favorite => 'Favorite',
    MediaSort.popularity => 'Popularity',
  };

  @override
  String getSearchTypeString(SearchType type)  => switch (type) {
    SearchType.anime => 'Anime',
    SearchType.manga => 'Manga',
    SearchType.character => 'Character',
    SearchType.staff => 'Voice Actor/Staff',
    SearchType.studio => 'Studio',
    SearchType.user => 'User',
  };
}

class JaAniFLowLocalizations extends AFLocalizations {
  @override
  String get trendingNowLabel => 'トレンド';

  @override
  String get upComingNextSeasonLabel => '次のシーズンのアニメ';

  @override
  String get popularThisSeasonLabel => '今シーズンの人気アニメ';

  @override
  String get discover => 'お探し';

  @override
  String get login => 'ログイン';

  @override
  String get logout => 'ログアウト';

  @override
  String get loginSuccessMessage => 'ログイン成功！';

  @override
  String get loginFailedMessage => 'ログインに失敗しました';

  @override
  String get dataRefreshed => 'アニメ情報とサーバー同期しました！';

  @override
  String get logoutSuccessMessage => 'ログアウトしました';

  @override
  String get allPageLoaded => 'すべてのページがロードされました';

  @override
  String get dataRefreshFailed => '同期失敗しました';

  @override
  String get retry => 'Retry';

  @override
  String get fail => '秋';

  @override
  String get spring => '春';

  @override
  String get summer => '夏';

  @override
  String get winter => '冬';

  @override
  String get backgroundCharacter => '';

  @override
  String get mainCharacter => '主役';

  @override
  String get supportingCharacter => '脇役';

  @override
  String get animeDescription => 'このアニメについて';

  @override
  String get characters => 'キャラクター';

  @override
  String get trailer => 'トレーラー';

  @override
  String get lightNovelAnimation => 'ライトノベル';

  @override
  String get mangaAnimation => '漫画';

  @override
  String get originalAnimation => 'オリジナル';

  @override
  String get otherAnimation => 'そのほか';

  @override
  String get videoGameAnimation => 'ゲーム';

  @override
  String get visualNovelAnimation => 'ビジュアルノベル';

  @override
  String get episodes => '話';

  @override
  String get animeFinished => '放送終了';

  @override
  String get animeNotYetReleased => 'まもなく公開!';

  @override
  String get animeReleasing => '放送中';

  @override
  String get movieLabel => '映画';

  @override
  String get followNewAnimation => 'Follow new animation';

  @override
  String get dropAnimation => 'drop the animation';

  @override
  String get animeCompleted => 'anime completed';

  @override
  String get animeMarkWatched => 'Anime mark watched';

  @override
  String get staff => 'スタッフ';

  @override
  String get allTimePopular => 'All time popular';

  @override
  String get topManhwa => 'Top Manhwa';

  @override
  String get favorite => 'Favorites';

  @override
  String get animeList => 'Anime List';

  @override
  String get mangaList => 'Manga List';

  @override
  String get reviews => 'Reviews';

  @override
  String get animeLabel => 'アニメ';

  @override
  String get mangaLabel => '漫画';

  @override
  String get social => 'Social';

  @override
  String getMediaSortString(MediaSort sort) => switch(sort) {
    MediaSort.trending => 'トレンド',
    MediaSort.newest => '最も新しい',
    MediaSort.oldest => '最も古い',
    MediaSort.averageScore => '平均スコア',
    MediaSort.favorite => 'お気に入り',
    MediaSort.popularity => '人気',
  };

  @override
  String getSearchTypeString(SearchType type)  => switch (type) {
    SearchType.anime => 'アニメ',
    SearchType.manga => '漫画',
    SearchType.character => 'キャラクター',
    SearchType.staff => '声優/スタッフ',
    SearchType.studio => 'スタジオ',
    SearchType.user => 'ユーサー',
  };
}

class CNAniFlowLocalizations extends AFLocalizations {
  @override
  String get trendingNowLabel => '趋势';

  @override
  String get upComingNextSeasonLabel => '下期动画';

  @override
  String get popularThisSeasonLabel => '本期动画';

  @override
  String get discover => '探索';

  @override
  String get login => '登陆';

  @override
  String get logout => '登出';

  @override
  String get loginSuccessMessage => '登录成功！';

  @override
  String get loginFailedMessage => '登陆失败';

  @override
  String get dataRefreshed => '动画信息和服务器同步了!';

  @override
  String get logoutSuccessMessage => '登出成功';

  @override
  String get allPageLoaded => '已加载所有的数据';

  @override
  String get dataRefreshFailed => '刷新失败';

  @override
  String get retry => '重试';

  @override
  String get fail => '秋';

  @override
  String get spring => '春';

  @override
  String get summer => '夏';

  @override
  String get winter => '冬';

  @override
  String get backgroundCharacter => '配角';

  @override
  String get mainCharacter => '主角';

  @override
  String get supportingCharacter => '配角';

  @override
  String get animeDescription => '关于这个动画';

  @override
  String get characters => '角色';

  @override
  String get trailer => '预告片';

  @override
  String get lightNovelAnimation => '轻小说';

  @override
  String get mangaAnimation => '漫画';

  @override
  String get originalAnimation => '原创';

  @override
  String get otherAnimation => '其他';

  @override
  String get videoGameAnimation => '游戏';

  @override
  String get visualNovelAnimation => '可视小说';

  @override
  String get episodes => '集';

  @override
  String get animeFinished => '已完结';

  @override
  String get animeNotYetReleased => '将要上映';

  @override
  String get animeReleasing => '放送中';

  @override
  String get movieLabel => '动画电影';

  @override
  String get followNewAnimation => 'Follow new animation';

  @override
  String get dropAnimation => 'drop the animation';

  @override
  String get animeCompleted => 'anime completed';

  @override
  String get animeMarkWatched => 'Anime mark watched';

  @override
  String get staff => '职员';

  @override
  String get allTimePopular => 'All time popular';

  @override
  String get topManhwa => 'Top Manhwa';

  @override
  String get favorite => 'Favorite';

  @override
  String get animeList => 'Anime List';

  @override
  String get mangaList => 'Manga List';

  @override
  String get reviews => 'Reviews';

  @override
  String get animeLabel => '动画';

  @override
  String get mangaLabel => '漫画';

  @override
  String get social => 'Social';

  @override
  String getMediaSortString(MediaSort sort) => switch(sort) {
    MediaSort.trending => '趋势',
    MediaSort.newest => '从新到旧',
    MediaSort.oldest => '从旧到新',
    MediaSort.averageScore => '平均分数',
    MediaSort.favorite => '最爱',
    MediaSort.popularity => '人气',
  };

  @override
  String getSearchTypeString(SearchType type)  => switch (type) {
    SearchType.anime => '动画',
    SearchType.manga => '漫画',
    SearchType.character => '角色',
    SearchType.staff => '声优/工作人员',
    SearchType.studio => '工作室',
    SearchType.user => '用户',
  };
}
