import 'dart:convert';

import 'package:test_app/constantes/api_url.dart';

import '../models/album.dart';
import 'package:http/http.dart' as http;

class AlbumProvider {
  static Future<Album> fetchAlbum(int id) async {
    final response = await http.get(Uri.parse("${ApiUrl.album}/$id"));
    if(response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load album");
    }
  }

  static Future<List<Album>> fetchListAlbum() async {
    final response = await http.get(Uri.parse(ApiUrl.album));
    if(response.statusCode == 200) {
      List<Album> albums = [];
      for (var json in jsonDecode(response.body)) {
        albums.add(Album.fromJson(json));
      }
      return albums;
    } else {
      throw Exception("Failed to load album");
    }
  }
}