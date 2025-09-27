import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:atlantis_shop/src/app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Integration Tests', () {
    testWidgets('should navigate through main screens', (tester) async {
      // Start the app
      await tester.pumpWidget(
        const ProviderScope(
          child: AtlantisApp(),
        ),
      );

      // Wait for splash screen to complete
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Should be on the catalog screen (home)
      expect(find.text('Atlantis Shop'), findsOneWidget);
      expect(find.text('Search products...'), findsOneWidget);

      // Navigate to search screen
      await tester.tap(find.text('Search'));
      await tester.pumpAndSettle();
      expect(find.text('Search Screen'), findsOneWidget);

      // Navigate to cart screen
      await tester.tap(find.text('Cart'));
      await tester.pumpAndSettle();
      expect(find.text('Cart Screen'), findsOneWidget);

      // Navigate to profile screen
      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();
      expect(find.text('Profile Screen'), findsOneWidget);

      // Navigate back to home
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      expect(find.text('Atlantis Shop'), findsOneWidget);
    });

    testWidgets('should handle navigation and UI interactions', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: AtlantisApp(),
        ),
      );

      // Wait for app to load
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Test search bar interaction
      final searchBar = find.text('Search products...');
      expect(searchBar, findsOneWidget);
      
      // Tap search bar (should be clickable but not navigate in current implementation)
      await tester.tap(searchBar);
      await tester.pumpAndSettle();

      // Test category chips
      expect(find.text('Electronics'), findsOneWidget);
      expect(find.text('Fashion'), findsOneWidget);

      // Test featured banner
      expect(find.text('Special Offer'), findsOneWidget);
      expect(find.text('Up to 50% off'), findsOneWidget);
      expect(find.text('Shop Now'), findsOneWidget);

      // Test banner button
      await tester.tap(find.text('Shop Now'));
      await tester.pumpAndSettle();
    });

    testWidgets('should display proper bottom navigation', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: AtlantisApp(),
        ),
      );

      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Check bottom navigation items
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Cart'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);

      // Check that navigation icons are present
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search_outlined), findsOneWidget);
      expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
    });
  });
}