import 'package:drift/drift.dart';

@DataClassName('ReleasedPackageEntity')
class ReleasedPackageTable extends Table {
  IntColumn get id =>
      integer().nullable().autoIncrement().named('released_package_id')();

  TextColumn get apkDownloadUrl =>
      text().named('released_package_apk_download_url')();

  TextColumn get tagName => text().named('released_package_tag_name')();
}
