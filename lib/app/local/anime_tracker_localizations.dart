import 'package:flutter/material.dart';

abstract class AnimeTrackerLocalizations {
  String get onboardingGuidanceTitle;

  String get onboardingGuidanceSubtitle;

  String get done;

  String get bookmarksEmptyError;

  String get bookmarksEmptyDescription;

  String get undoLabel;

  String get bookmarkRemoved;

  String get emptyHeader;

  static AnimeTrackerLocalizations of(BuildContext context) {
    return Localizations.of<AnimeTrackerLocalizations>(context, AnimeTrackerLocalizations)!;
  }
}

class EnAnimeTrackerLocalizations extends AnimeTrackerLocalizations {
  @override
  String get onboardingGuidanceTitle => 'What are you interested in?';

  @override
  String get onboardingGuidanceSubtitle =>
      'Updates from topics you follow will appear here. Follow some things to get started.';

  @override
  String get done => 'Done';

  @override
  String get bookmarksEmptyError => 'No saved updates';

  @override
  String get bookmarksEmptyDescription =>
      'Updates you save will be stored here\nto read later';

  @override
  String get undoLabel => 'Undo';

  @override
  String get bookmarkRemoved => 'Bookmark removed';

  @override
  String get emptyHeader => 'No available data';
}

class JaAnimeTrackerLocalizations extends AnimeTrackerLocalizations {
  @override
  String get onboardingGuidanceTitle => 'あなたは何に興味がありますか？';

  @override
  String get onboardingGuidanceSubtitle =>
      'フォローしているトピックの更新情報がここに表示されます。 開始するには、いくつかの手順に従ってください。';

  @override
  String get done => '完了';

  @override
  String get bookmarksEmptyError => '保存された更新はありません';

  @override
  String get bookmarksEmptyDescription => '保存した更新はここに保存され、後で読むことができます';

  @override
  String get undoLabel => '取り消し';

  @override
  String get bookmarkRemoved => 'ブックマークを削除';

  @override
  String get emptyHeader => '利用可能なデータがありません';
}

class CNAnimeTrackerLocalizations extends AnimeTrackerLocalizations {
  @override
  String get onboardingGuidanceTitle => '选择你感兴趣的';

  @override
  String get onboardingGuidanceSubtitle => '您关注的主题的更新将显示在此处。 遵循一些事项即可开始。';

  @override
  String get done => '决定';

  @override
  String get bookmarksEmptyError => '没有保存的';

  @override
  String get bookmarksEmptyDescription => '您保存的更新将存储在此处以供稍后阅读';

  @override
  String get undoLabel => '回退';

  @override
  String get bookmarkRemoved => '删除书签';

  @override
  String get emptyHeader => '没有数据';
}
