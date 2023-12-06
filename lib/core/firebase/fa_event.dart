
enum FaEvent {
  screenTransaction(eventName: 'screen_transaction'),
  likeStateChanged(eventName: 'like_state_changed'),
  mediaList(eventName: 'modify_media_list');

  final String eventName;

  const FaEvent({required this.eventName});
}

enum LikeContentType {
  anime(name: 'anime'),
  manga(name: 'manga'),
  character(name: 'character'),
  staff(name: 'staff');

  final String name;

  const LikeContentType({required this.name});
}