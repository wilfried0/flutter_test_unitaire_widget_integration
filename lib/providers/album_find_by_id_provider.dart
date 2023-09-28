import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/dto/album_dto.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/services/album_service.dart';

final albumFindByIdProvider = StateNotifierProvider<AlbumFindByIdProvider, AlbumDTO>(
        (ref) => AlbumFindByIdProvider(ref.watch(albumService)));

class AlbumFindByIdProvider extends StateNotifier<AlbumDTO> {
  final AlbumService _albumService;
  AlbumFindByIdProvider(this._albumService):super(AlbumDTO(isLoading: false, album: const Album()));

  findById({required int id}) async {
    try {
      state = AlbumDTO(isLoading: true, album: const Album());
      await _albumService.fetchAlbum(id).then((response) {
        state = AlbumDTO(isLoading: false, album: response);
      });
    }catch(e) {
      state = AlbumDTO(isLoading: false, album: const Album());
      throw Exception("Album with id = $id not found!");
    }
  }
}