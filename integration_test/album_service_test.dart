import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/constantes/api_url.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/services/impl/album_service_impl.dart';
import 'package:http/http.dart' as http;
import '../test/album_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AlbumServiceImpl>()])
@GenerateMocks([http.Client])
void main() {
  late MockAlbumServiceImpl albumServiceImpl;
  late MockClient client;
  const album = Album(id: 1, title: 'Titre test', userId: 1);
  const albums = [Album(id: 1, title: 'Test titre 1', userId: 1), Album(id: 2, userId: 2, title: 'Test titre 2')];

  setUp(() {
    albumServiceImpl = MockAlbumServiceImpl();
    client = MockClient();
  });

  group('fetchAlbum', () {
    test('simulation of http client get function', () async {
      when(client.get(Uri.parse('${ApiUrl.album}/1')))
          .thenAnswer((_) async {
            return http.Response(jsonEncode(album), 200);
      });
      expect(await client.get(Uri.parse('${ApiUrl.album}/1')), isA<http.Response>());
      verify(client.get(Uri.parse('${ApiUrl.album}/1')));
    });

    test('Return an album if http call completes successfully', () async {
      when(albumServiceImpl.fetchAlbum(1))
          .thenAnswer((_) async => album);
      expect(await albumServiceImpl.fetchAlbum(1), isA<Album>());

      verify(albumServiceImpl.fetchAlbum(1));
      verifyNoMoreInteractions(albumServiceImpl);
    });

    test('Throws an exception if http client call throws an error', () async {
      when(client.get(Uri.parse('${ApiUrl.album}/0')))
          .thenAnswer((_) async => http.Response('{}', 404));
      expect(await client.get(Uri.parse('${ApiUrl.album}/0')), isA<http.Response>());

      verify(client.get(Uri.parse('${ApiUrl.album}/0')));
    });
  });

  group('fetchListAlbum', () {
    test('simulation of http client get function', () async {
      when(client.get(Uri.parse(ApiUrl.album)))
          .thenAnswer((_) async => http.Response(jsonEncode(albums), 200));
      expect(await client.get(Uri.parse(ApiUrl.album)), isA<http.Response>());
      verify(client.get(Uri.parse(ApiUrl.album)));
    });

    test('Return a list of album if http call completes successfully', () async {
      when(albumServiceImpl.fetchListAlbum())
          .thenAnswer((_) async => albums);
      expect(await albumServiceImpl.fetchListAlbum(), isA<List<Album>>());

      verify(albumServiceImpl.fetchListAlbum());
      verifyNoMoreInteractions(albumServiceImpl);
    });
  });
}