import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/providers/album_find_by_id_provider.dart';
import 'package:test_app/services/impl/album_service_impl.dart';

@GenerateNiceMocks([MockSpec<AlbumFindByIdProvider>(), MockSpec<AlbumServiceImpl>()])
void main() {
  late AlbumServiceImpl albumServiceImpl;
  late AlbumFindByIdProvider albumFindByIdProvider;
  const album = Album(id: 1, title: 'Titre test', userId: 1);

  setUp(() {
    albumServiceImpl = AlbumServiceImpl();
    albumFindByIdProvider = AlbumFindByIdProvider(albumServiceImpl);
  });

  test('Return an album with state notifier', () async {
    when(albumFindByIdProvider.findById(id: 1))
        .thenAnswer((_) => Future.value(album));

    expect(await albumFindByIdProvider.findById(id: 1), isA<Album>());

    verify(albumFindByIdProvider.findById(id: 1));
    verifyNoMoreInteractions(albumFindByIdProvider);
    verifyNoMoreInteractions(albumServiceImpl);
  });
}