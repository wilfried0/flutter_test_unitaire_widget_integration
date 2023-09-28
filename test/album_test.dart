
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/constantes/api_url.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/providers/album_find_all_provider.dart';
import 'package:test_app/services/album_service.dart';

import 'album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final client = MockClient();

  group('fetchAlbum', () {
    test('Return an album if http call completes successfully', () async {
      when(client.get(Uri.parse('${ApiUrl.album}/1')))
          .thenAnswer((_) async => http.Response('{"userId":1, "id":1, "title":"Titre test"}', 200));
      expect(await AlbumService.fetchAlbum(1), isA<Album>());
    });

    test('Throws an exception if http call completes with an error', () {
      when(client.get(Uri.parse('${ApiUrl.album}/0'))).thenAnswer(
          (_) async => http.Response("Album not found", 404));
      expect(AlbumService.fetchAlbum(0), throwsException);
    });
  });

  group('fetchListAlbum', () {
    test('Return a list of album if http call completes successfully', () async {
      when(client.get(Uri.parse(ApiUrl.album)))
          .thenAnswer((_) async => http.Response('[{"userId":1, "id":1, "title":"Titre test"}, {"userId":1, "id":2, "title":"Titre test"}]', 200));
      expect(await AlbumService.fetchListAlbum(), isA<List<Album>>());
    });
  });
}