// import 'package:flutter/foundation.dart';
// import 'package:just_audio/just_audio.dart';

// class AudioPlayerService {
//   final AudioPlayer _audioPlayer = AudioPlayer().internal();
//   bool isPlaying = false;
//   String url = "https://securestreams5.autopo.st:1941/stream?type=http&nocache=8390";

//   AudioPlayerService() {
//     _initializeAudio();
//   }

//   get currentPositionStream => null;

//   Future<void> _initializeAudio() async {
//     try {
//       await _audioPlayer.setUrl(url);
//       if (kDebugMode) {
//         print('Audio initialized');
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error initializing audio: $e');
//       }
//     }
//   }

//   void playPause() {
//     if (isPlaying) {
//       _audioPlayer.pause();
//     } else {
//       _audioPlayer.play();
//     }
//     isPlaying = !isPlaying;
//   }

//   void dispose() {
//     _audioPlayer.dispose();
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  static final AudioPlayerService _instance = AudioPlayerService._internal();
  factory AudioPlayerService() => _instance;

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String url =
      "https://securestreams5.autopo.st:1941/stream?type=http&nocache=8390";

  AudioPlayerService._internal() {
    _initializeAudio();
  }

  Stream<bool> get playerStateStream => _audioPlayer.playingStream;

  Future<void> _initializeAudio() async {
    try {
      await _audioPlayer.setUrl(url);
      if (kDebugMode) {
        print('Audio initialized');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing audio: $e');
      }
    }
  }

  void playPause() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    isPlaying = !isPlaying;
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
