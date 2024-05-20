import 'dart:convert';

import 'package:exam_json/models/user.dart';
import 'package:http/http.dart' as http;

class AlbumService {
  static const String baseUrl =
      'https://jsonplaceholder.typicode.com/albums/1/photos';
  static Future<List<Album>> fetchAlbum() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> result = jsonDecode(response.body);

        List<Album> lastAlbum =
            result.map((albums) => Album.fromJson(albums)).toList();

        return lastAlbum;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
