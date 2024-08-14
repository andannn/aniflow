import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

const String _screenShotPath = 'build/integration_test/screen_shot/';

Future<void> main() {
  final screenShot = Directory(_screenShotPath);
  if (screenShot.existsSync()) {
    screenShot.deleteSync(recursive: true);
  }
  return integrationDriver(
    onScreenshot: (String path, List<int> screenshotBytes,
        [Map<String, Object?>? args]) async {
      final File image = File('$_screenShotPath$path.png');
      final exist = image.existsSync();
      if (!exist) {
        await image.create(recursive: true);
      }
      image.writeAsBytesSync(screenshotBytes);
      return true;
    },
  );
}
