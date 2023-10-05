import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app/providers/album_find_by_id_provider.dart';
import 'package:test_app/services/impl/album_service_impl.dart';
import '../album_find_by_id_provider_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AlbumFindByIdProvider>(),
  MockSpec<AlbumServiceImpl>()
])
void main() {
  late MockAlbumServiceImpl albumServiceImpl;
  late MockAlbumFindByIdProvider albumFindByIdProvider;

  setUp(() {
    albumServiceImpl = MockAlbumServiceImpl();
    albumFindByIdProvider = MockAlbumFindByIdProvider(albumServiceImpl);
  });

  test('Return an album with state notifier', () async {
    when(albumFindByIdProvider.findById(id: 1))
        .thenAnswer((_) async {});

    expect(await albumFindByIdProvider.findById(id: 1), isA<void>());

    verify(albumFindByIdProvider.findById(id: 1));
    verifyNoMoreInteractions(albumFindByIdProvider);
    verifyNoMoreInteractions(albumServiceImpl);
  });
}