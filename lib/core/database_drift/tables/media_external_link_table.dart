import 'package:drift/drift.dart';

@DataClassName('MediaExternalLinkEntity')
class MediaExternalLinkTable extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text().named('external_link_id')();

  TextColumn get mediaId => text().named('external_link_media_id')();

  TextColumn get url => text().named('external_link_url').nullable()();

  TextColumn get site => text().named('external_link_site').nullable()();

  TextColumn get type => text().named('external_link_type').nullable()();

  IntColumn get siteId => integer().named('external_link_siteId').nullable()();

  TextColumn get color => text().named('external_link_color').nullable()();

  TextColumn get icon => text().named('external_link_icon').nullable()();
}
