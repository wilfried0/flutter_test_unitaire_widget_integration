import '../models/album.dart';

abstract class AlbumService {
  Future<Album> fetchAlbum(int id);
  Future<List<Album>> fetchListAlbum();
}