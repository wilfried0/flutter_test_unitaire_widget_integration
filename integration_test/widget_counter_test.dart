import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_app/main.dart';
import 'package:test_app/screen/list_album.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  Isolate? isolate;

  group('increment and decrement actions on main page', () {
    testWidgets('increment', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: MaterialApp(home: MyHomePage(title: 'Titre'))));

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byKey(const Key('title')), findsOneWidget);

      expect(find.text('0'), findsOneWidget);
      //expect(find.text('1'), findsNothing);

      await tester.tap(find.byKey(const Key('key1')));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
      //expect(find.text('0'), findsNothing);

      /*
      * Décrémentation
      * */

      expect(find.text('1'), findsOneWidget);
      //expect(find.text('0'), findsNothing);

      await tester.tap(find.byKey(const Key('key2')));
      await tester.pump();

      expect(find.text('0'), findsOneWidget);
      //expect(find.text('1'), findsNothing);

      isolate!.pause();

      /*expect(find.byType(ElevatedButton), findsOneWidget);
      await tester.tap(find.byKey(const Key('router')));
      await tester.pumpFrames(
          const ProviderScope(child: MaterialApp(home: ListAlbum())),
          const Duration(seconds: 10)
      );*/
      //const Duration(seconds: 5);
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