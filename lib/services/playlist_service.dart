import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:powerfm/models/playlist_model.dart';

class PlaylistProvider with ChangeNotifier {
  List<Playlist> _playlistList = [];

  List<Playlist> get playlistList => _playlistList;

  Future<void> fetchMedia() async {
    final url =
        Uri.parse('https://www.powerfm.co.ug/wp-json/wp/v2/sr_playlist');
    try {
      print('Fetching media from $url...');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        _playlistList = data.map((item) => Playlist.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load media');
      }
    } catch (error) {
      rethrow;
    }
  }
}
