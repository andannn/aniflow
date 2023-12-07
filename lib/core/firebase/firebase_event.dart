
enum FirebaseEvent {
  screenTransaction(eventName: 'screen_transaction'),
  like(eventName: 'like'),
  mediaList(eventName: 'modify_media_list');

  final String eventName;

  const FirebaseEvent({required this.eventName});
}

enum FirebaseUserProperty {
  mediaContent(propertyName: 'media_content');

  final String propertyName;

  const FirebaseUserProperty({required this.propertyName});
}