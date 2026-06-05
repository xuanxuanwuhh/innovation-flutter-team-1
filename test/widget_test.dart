import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_hello_personalized/main.dart';

void main() {
  testWidgets('group page displays members and check-in', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FreshHelloApp());

    expect(find.text('创新实验 Flutter 首页'), findsOneWidget);
    expect(find.text('🌿 Hello Flutter'), findsOneWidget);
    expect(find.text('0 次'), findsOneWidget);

    // 打卡
    final checkBtn = find.byIcon(Icons.check);
    await tester.ensureVisible(checkBtn.first);
    await tester.pumpAndSettle();
    await tester.tap(checkBtn.first);
    await tester.pump();

    expect(find.text('1 次'), findsOneWidget);
  });
}
