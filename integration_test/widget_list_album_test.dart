import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/providers/album_find_all_provider.dart';
import 'package:test_app/screen/list_album.dart';
import 'package:test_app/services/impl/album_service_impl.dart';

import '../test/album_find_by_id_provider_test.mocks.dart';


@GenerateNiceMocks([MockSpec<AlbumServiceImpl>()])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockAlbumServiceImpl albumServiceImpl;
  const albums = [Album(id: 1, title: 'Test titre 1', userId: 1), Album(id: 2, userId: 2, title: 'Test titre 2')];

  setUp(() {
    albumServiceImpl = MockAlbumServiceImpl();
  });

  group('fetch list album', () {
    testWidgets('List album widget test completed successfully', (tester) async {
      await tester.pumpWidget(ProviderScope(
          overrides: [
            albumFindAllProvider.overrideWith((ref) {
              return albumServiceImpl.fetchListAlbum()
                  .then((value) => albums);
            })
          ],
          child: const MaterialApp(home: ListAlbum())));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(albums.length));
      for(var album in albums) {
        expect(find.text(album.title!), findsOneWidget);
        expect(find.text('${album.id}'), findsOneWidget);
      }
    });

    testWidgets('List album widget test completed with catch error', (tester) async {
      await tester.pumpWidget(ProviderScope(
          overrides: [
            albumFindAllProvider.overrideWith((ref) {
              return albumServiceImpl.fetchListAlbum()
              .then((value) => Future.error(value));
            })
          ],
          child: const MaterialApp(home: ListAlbum())));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('error')), findsOneWidget);
    });
  });
}