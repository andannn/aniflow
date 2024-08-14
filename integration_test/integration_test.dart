import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("detail media page", (WidgetTester tester) async {
    const folder = 'detail_media';
    await tester.pumpWidget(Container(color: Colors.red));

    await (binding, tester).takeScreenshot(folder,'first');
  });

  testWidgets("test1", (WidgetTester tester) async {
    const folder = 'detail_media';
    await tester.pumpWidget(Container(color: Colors.red));

    await (binding, tester).takeScreenshot(folder,'first1');
  });
}

extension on (IntegrationTestWidgetsFlutterBinding, WidgetTester) {
  Future<void> takeScreenshot(String folder, String name) async {
    final (binding, tester)  = this;
    await binding.convertFlutterSurfaceToImage();
    await tester.pumpAndSettle();
    await binding.takeScreenshot('$folder/$name');
  }
}
