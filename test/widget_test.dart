import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:flutter_fastapi/app/app.dart';

void main() {
  tearDown(Get.reset);

  testWidgets('renders the application shell', (WidgetTester tester) async {
    await tester.pumpWidget(Application());

    expect(find.text('Flutter FastAPI'), findsOneWidget);
    expect(find.text('clicked 0 times'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
