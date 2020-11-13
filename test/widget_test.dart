import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:duszamobile2020/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());

    await tester.pumpAndSettle();

    // Verify that our counter starts at 0.
    expect(find.text('Choose cars here'), findsOneWidget);
    expect(find.text('Kocsiaim'), findsNothing);
  });
}
