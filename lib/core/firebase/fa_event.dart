/// Firebase analytics event.
enum FaEvent {
  screenTransaction(name: 'screen_transaction'),
  likeStateChanged(name: 'like_state_changed'),
  modifyMediaList(name: 'modify_media_list'),
  logAppDataSize(name: 'log_app_data_size');

  final String name;

  const FaEvent({required this.name});
}

///
/// Firebase Analytics Dimension.
///

/// [FaEvent.screenTransaction]
enum ScreenTransactionDimension {
  screenName(name: 'screen_name');

  final String name;

  const ScreenTransactionDimension({required this.name});
}

/// [FaEvent.likeStateChanged]
enum LikeStateChangedDimension {
  like(name: 'liked'),
  unliked(name: 'unliked');

  final String name;

  const LikeStateChangedDimension({required this.name});
}

/// [FaEvent.logAppDataSize]
enum LogAppDataSizeDimension {
  imgCacheSize(dimensionName: 'img_cache_size'),
  userDataSize(dimensionName: 'user_data_size');

  final String dimensionName;

  const LogAppDataSizeDimension({required this.dimensionName});
}


///
/// Firebase Analytics Metrics.
///

enum LikeContentMetrics {
  anime(name: 'anime'),
  manga(name: 'manga'),
  character(name: 'character'),
  staff(name: 'staff');

  final String name;

  const LikeContentMetrics({required this.name});
}
