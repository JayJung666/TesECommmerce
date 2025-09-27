import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:atlantis_shop/src/app.dart';

void main() {
  group('AtlantisApp', () {
    testWidgets('renders AtlantisApp', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: AtlantisApp(),
        ),
      );
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}