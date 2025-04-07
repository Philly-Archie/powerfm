// import 'package:flutter/material.dart';
// import 'song.dart';

// class PlaylistProvider extends ChangeNotifier {
//   final List<Song> _playlists = [
//     Song(
//         songName: "Hark-The-Herald-Angels-Sing",
//         artistName: "We Are Messengers",
//         albumArtImagePath: "assets/images/pic1.jpg",
//         audiopath: "audio/We-Are-Messengers-Hark-The-Herald-Angels-Sing.mp3"),
//     Song(
//         songName: "No One Else",
//         artistName: "Watoto Worchip",
//         albumArtImagePath: "assets/images/pic2.jpg",
//         audiopath: "audio/Watoto-Worship-No-One-Else.mp3"),
//     Song(
//         songName: "Go-Tell-It-on-the-Mountain",
//         artistName: "Zach-Williams",
//         albumArtImagePath: "assets/images/pic3.jpg",
//         audiopath: "audio/Zach-Williams-Go-Tell-It-on-the-Mountain.mp3"),
//   ];

//   int? _currentSongIndex;

//   // Getters
//   List<Song> get playlists => _playlists;
//   int? get currentSongIndex => _currentSongIndex;

//   //Setters
//   set currentSongIndex(int? newIndex) {
//     _currentSongIndex = newIndex;

//     notifyListeners();
//   }
// }
