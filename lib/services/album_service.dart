import '../models/album.dart';

abstract interface class AlbumService {
  Future<Album> fetchAlbum(int id);
  Future<List<Album>> fetchListAlbum();
}