import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:flutter_test/flutter_test.dart';

// The generated directory from before.
import 'generated_migrations/schema.dart';


void main() {
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  test('upgrade from v1 to v2', () async {
    final connection = await verifier.startAt(1);
    final db = AniflowDatabase(connection);

    await verifier.migrateAndValidate(db, 2);
  });

  test('upgrade from v7 to v8', () async {
    final connection = await verifier.startAt(7);
    final db = AniflowDatabase(connection);

    await verifier.migrateAndValidate(db, 8);
  });

  test('upgrade from v8 to v9', () async {
    final connection = await verifier.startAt(8);
    final db = AniflowDatabase(connection);

    await verifier.migrateAndValidate(db, 9);
  });

  // test('upgrade from v8 to v9', () async {
  //   final connection = await verifier.startAt(9);
  //   final db = AniflowDatabase(connection);
  //
  //   await verifier.migrateAndValidate(db, 10);
  // });
}