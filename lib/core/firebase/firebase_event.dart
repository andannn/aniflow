
import 'package:aniflow/core/firebase/data_size_property/data_type.dart';

enum FirebaseEvent {
  screenTransaction(eventName: 'screen_transaction'),
  like(eventName: 'like'),
  mediaList(eventName: 'modify_media_list');

  final String eventName;

  const FirebaseEvent({required this.eventName});
}

enum FirebaseUserProperty {
  mediaContent(propertyName: 'media_content'),
  imgCacheSize(propertyName: 'img_cache_size'),
  userDataSize(propertyName: 'user_data_size');

  final String propertyName;

  const FirebaseUserProperty({required this.propertyName});

  static FirebaseUserProperty fromDataType(DataType type) => switch (type) {
    DataType.userData => FirebaseUserProperty.userDataSize,
    DataType.imgCache => FirebaseUserProperty.imgCacheSize,
  };
}
