import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/main.dart';


void main() {
  group('increment and decrement actions on main page', () {
    testWidgets('increment', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: MyHomePage(title: 'Titre'))));

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      await tester.tap(find.byKey(const Key('key1')));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);

      /*
      * Décrémentation
      * */

      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);

      await tester.tap(find.byKey(const Key('key2')));
      await tester.pump();

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });

    /*testWidgets('decrement', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: MyHomePage(title: 'Titre'))));

      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);

      await tester.tap(find.byKey(const Key('key2')));
      await tester.pump();

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });*/
  });
}