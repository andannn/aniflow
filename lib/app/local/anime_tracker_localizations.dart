import 'package:anime_tracker/app/app.dart';
import 'package:flutter/material.dart';

abstract class ATLocalizations {
  String get trendingNowLabel;

  String get popularThisSeasonLabel;

  String get upComingNextSeasonLabel;

  String get discover;

  String get login;

  String get logout;

  String get logoutSuccessMessage;

  String get loginSuccessMessage;

  String get loginFailedMessage;

  String get dataRefreshed;

  String get allPageLoaded;

  static ATLocalizations of([BuildContext? context]) {
    return Localizations.of<ATLocalizations>(
        context ?? globalContext!, ATLocalizations)!;
  }
}

class EnAnimeTrackerLocalizations extends ATLocalizations {
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
}

class JaAnimeTrackerLocalizations extends ATLocalizations {
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
}

class CNAnimeTrackerLocalizations extends ATLocalizations {
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
}
