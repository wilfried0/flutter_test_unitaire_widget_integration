import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/constantes/api_url.dart';
import 'package:test_app/services/album_service.dart';

import '../../models/album.dart';
import 'package:http/http.dart' as http;

final albumService = Provider<AlbumServiceImpl>((ref) => AlbumServiceImpl());

class AlbumServiceImpl implements AlbumService {

  @override
  Future<Album> fetchAlbum(int id) async {
    // TODO: implement fetchAlbum
    final response = await http.get(Uri.parse("${ApiUrl.album}/$id"));
    if(response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load album");
    }
  }

  @override
  Future<List<Album>> fetchListAlbum() async {
    // TODO: implement fetchListAlbum
    final response = await http.get(Uri.parse(ApiUrl.album));
    if(response.statusCode == 200) {
      final List list = jsonDecode(response.body);
      return list.map(((json) => Album.fromJson(json))).toList();
    } else {
      throw Exception("Failed to load all the album");
    }
  }
}