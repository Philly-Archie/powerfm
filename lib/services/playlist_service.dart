// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:powerfm/models/playlist_model.dart';

// class PlaylistProvider with ChangeNotifier {
//   List<Playlist> _playlistList = [];

//   List<Playlist> get playlistList => _playlistList;

//   Future<void> fetchMedia() async {
//     final url =
//         Uri.parse('https://www.powerfm.co.ug/wp-json/wp/v2/sr_playlist');
//     try {
//       print('Fetching media from $url...');
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         List<dynamic> data = json.decode(response.body);
//         _playlistList = data.map((item) => Playlist.fromJson(item)).toList();
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load media');
//       }
//     } catch (error) {
//       rethrow;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Song {
  final String songName;
  final String artistName;
  final String audioUrl;
  final String albumArtImagePath;

  Song({
    required this.songName,
    required this.artistName,
    required this.audioUrl,
    required this.albumArtImagePath,
  });
}

class PlaylistProvider with ChangeNotifier {
  List<Song> _playlists = [];
  int? _currentSongIndex;

  List<Song> get playlists => _playlists;
  int? get currentSongIndex => _currentSongIndex;

  set currentSongIndex(int? index) {
    _currentSongIndex = index;
    notifyListeners();
  }

  Future<void> fetchAudioFiles() async {
    final response = await http.get(
      Uri.parse(
          'https://www.powerfm.co.ug/wp-json/wp/v2/media?media_type=audio'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _playlists = data.map((json) {
        return Song(
          songName: json['title']['rendered'],
          artistName: json['artist'] ?? 'Unknown Artist',
          audioUrl: json['source_url'],
          albumArtImagePath: json['_wp_attachment_metadata']['image'] != null
              ? json['_wp_attachment_metadata']['image']['source_url']
              : 'assets/images/default_album_art.jpg',
        );
      }).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load audio files');
    }
  }
}
