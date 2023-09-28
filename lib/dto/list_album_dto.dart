import '../models/album.dart';

class ListAlbumDTO {
  final bool isLoading;
  final List<Album> albums;

  ListAlbumDTO({required this.isLoading, required this.albums});
}