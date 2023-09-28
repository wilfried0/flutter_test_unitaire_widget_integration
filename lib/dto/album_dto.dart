import '../models/album.dart';

class AlbumDTO {
  final bool isLoading;
  final Album album;

  AlbumDTO({required this.isLoading, required this.album});
}