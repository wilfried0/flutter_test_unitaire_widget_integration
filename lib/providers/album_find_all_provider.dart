import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/models/album.dart';
import 'package:test_app/services/impl/album_service_impl.dart';

final albumFindAllProvider = FutureProvider<List<Album>>(
        (ref) async => ref.watch(albumService).fetchListAlbum());