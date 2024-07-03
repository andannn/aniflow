import 'package:drift/drift.dart';

@DataClassName('UserEntity')
class UserTable extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text().named('user_data_id')();

  TextColumn get name => text().named('user_data_name')();

  TextColumn get avatarImage =>
      text().named('user_data_avatar_image').nullable()();

  TextColumn get bannerImage =>
      text().named('user_data_banner_image').nullable()();

  TextColumn get profileColor =>
      text().named('user_data_profile_color').nullable()();

  TextColumn get siteUrl =>
      text().named('user_data_site_url').nullable()();

  IntColumn get unreadNotificationCount =>
      integer().named('user_data_unread_notification_count').nullable()();
}
