import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart';
part 'album.g.dart';

@freezed
class Album with _$Album {
  const factory Album({
    int? id,
    int? userId,
    String? title,
}) = _Album;

  factory Album.fromJson(Map<String, Object?> json)
  => _$AlbumFromJson(json);
}