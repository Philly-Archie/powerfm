// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
//
// class ExtrasPage extends StatelessWidget {
//   const ExtrasPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> _imagePaths = [
//       'assets/images/pic1.jpg',
//       'assets/images/pic2.jpg',
//       'assets/images/pic3.jpg',
//       'assets/images/pic4.jpg',
//       'assets/images/pic5.jpg',
//       'assets/images/pic6.jpg',
//       'assets/images/pic7.jpg',
//     ];
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/bg1.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//
//           // Main Content
//           SafeArea(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.05),
//
//                 // Title
//                 Text(
//                   'Power FM Extras',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     shadows: [
//                       Shadow(
//                         blurRadius: 10.0,
//                         color: Colors.black.withOpacity(0.5),
//                         offset: const Offset(2.0, 2.0),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // Carousel Slider for Images
//                 CarouselSlider.builder(
//                   itemCount: _imagePaths.length,
//                   itemBuilder: (context, index, realIndex) {
//                     return Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         image: DecorationImage(
//                           image: AssetImage(_imagePaths[index]),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     );
//                   },
//                   options: CarouselOptions(
//                     height: 200,
//                     autoPlay: true,
//                     enlargeCenterPage: true,
//                     aspectRatio: 16/9,
//                     viewportFraction: 0.8,
//                     scrollPhysics: BouncingScrollPhysics(),
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // Slider for controlling playback
//                 Slider(
//                   value: 20,
//                   min: 0,
//                   max: 100,
//                   divisions: 5,
//                   label: "Player",
//                   onChanged: (double value) {
//                     // Handle slider value changes
//                   },
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // Button Row for Back, Play, and Next
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Back Button
//                     IconButton(
//                       icon: const Icon(Icons.skip_previous_outlined, size: 40, color: Colors.white),
//                       onPressed: () {
//                         // Handle back action
//                       },
//                     ),
//
//                     const SizedBox(width: 20),
//
//                     // Play Button
//                     FloatingActionButton(
//                       backgroundColor: Colors.white,
//                       onPressed: () {
//                         // Handle play action
//                       },
//                       child: const Icon(
//                         Icons.play_arrow_rounded,
//                         size: 40,
//                         color: Colors.greenAccent,
//                       ),
//                     ),
//
//                     const SizedBox(width: 20),
//
//                     // Next Button
//                     IconButton(
//                       icon: const Icon(Icons.skip_next_outlined, size: 40, color: Colors.white),
//                       onPressed: () {
//                         // Handle next action
//                       },
//                     ),
//                   ],
//                 ),
//
//                 const Spacer(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ExtrasPage extends StatelessWidget {
//   const ExtrasPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<String> imagePaths = [
//       'assets/images/pic1.jpg',
//       'assets/images/pic2.jpg',
//       'assets/images/pic3.jpg',
//       'assets/images/pic4.jpg',
//       'assets/images/pic5.jpg',
//       'assets/images/pic6.jpg',
//       'assets/images/pic7.jpg',
//     ];

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/bg1.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           // Main Content
//           SafeArea(
//             child: Column(
//               children: [
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.05),

//                 // Title
//                 Text(
//                   'Power FM Extras',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     shadows: [
//                       Shadow(
//                         blurRadius: 10.0,
//                         color: Colors.black.withOpacity(0.5),
//                         offset: const Offset(2.0, 2.0),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Custom Carousel using PageView
//                 SizedBox(
//                   height: 200,
//                   child: PageView.builder(
//                     itemCount: imagePaths.length,
//                     controller: PageController(viewportFraction: 0.8),
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 8.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12),
//                           image: DecorationImage(
//                             image: AssetImage(imagePaths[index]),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),

//                 const SizedBox(height: 60),

//                 // Slider for controlling playback
//                 Slider(
//                   value: 20,
//                   min: 0,
//                   max: 100,
//                   divisions: 5,
//                   label: "Player",
//                   onChanged: (double value) {
//                     // Handle slider value changes
//                   },
//                 ),

//                 const SizedBox(height: 40),

//                 // Button Row for Back, Play, and Next
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Back Button
//                     IconButton(
//                       icon: const Icon(Icons.skip_previous_outlined,
//                           size: 40, color: Colors.white),
//                       onPressed: () {
//                         // Handle back action
//                       },
//                     ),

//                     const SizedBox(width: 20),

//                     // Play Button
//                     FloatingActionButton(
//                       backgroundColor: Colors.white,
//                       onPressed: () {
//                         // Handle play action
//                       },
//                       child: const Icon(
//                         Icons.play_arrow_rounded,
//                         size: 40,
//                         color: Colors.greenAccent,
//                       ),
//                     ),

//                     const SizedBox(width: 20),

//                     // Next Button
//                     IconButton(
//                       icon: const Icon(Icons.skip_next_outlined,
//                           size: 40, color: Colors.white),
//                       onPressed: () {
//                         // Handle next action
//                       },
//                     ),
//                   ],
//                 ),

//                 const Spacer(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'models/playlist_provider.dart';

// class ExtrasPage extends StatefulWidget {
//   const ExtrasPage({Key? key}) : super(key: key);

//   @override
//   State<ExtrasPage> createState() => _ExtrasPageState();
// }

// class _ExtrasPageState extends State<ExtrasPage> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   final PlaylistProvider _playlistProvider = PlaylistProvider();
//   bool _isPlaying = false;
//   bool _isLoaded = false;
//   Duration _currentPosition = Duration.zero;
//   Duration _totalDuration = Duration.zero;

//   @override
//   void initState() {
//     super.initState();
//     _playlistProvider.currentSongIndex = 0; // Start with the first song
//     _loadSong();

//     // Listen to audio position changes
//     _audioPlayer.onPositionChanged.listen((position) {
//       setState(() {
//         _currentPosition = position;
//       });
//     });

//     // Listen to the total duration of the current track
//     _audioPlayer.onDurationChanged.listen((duration) {
//       setState(() {
//         _totalDuration = duration;
//       });
//     });

//     // Listen for song completion
//     _audioPlayer.onPlayerComplete.listen((_) => _playNextSong());
//   }

//   void _loadSong() async {
//     if (_playlistProvider.currentSongIndex != null) {
//       final currentSong =
//           _playlistProvider.playlists[_playlistProvider.currentSongIndex!];
//       await _audioPlayer.setSource(AssetSource(currentSong.audiopath));
//       setState(() {
//         _isLoaded = true;
//         _currentPosition = Duration.zero;
//         _totalDuration = Duration.zero;
//       });
//     }
//   }

//   void _playPauseMusic() async {
//     if (_isPlaying) {
//       await _audioPlayer.pause();
//     } else {
//       await _audioPlayer.resume();
//     }
//     setState(() {
//       _isPlaying = !_isPlaying;
//     });
//   }

//   void _playNextSong() {
//     if (_playlistProvider.currentSongIndex != null) {
//       _audioPlayer.stop();
//       setState(() {
//         _playlistProvider.currentSongIndex =
//             (_playlistProvider.currentSongIndex! + 1) %
//                 _playlistProvider.playlists.length;
//         _isPlaying = false;
//       });
//       _loadSong();
//     }
//   }

//   void _playPreviousSong() {
//     if (_playlistProvider.currentSongIndex != null) {
//       _audioPlayer.stop();
//       setState(() {
//         // Restart current song if more than 2 seconds have played
//         if (_currentPosition.inSeconds > 2) {
//           _currentPosition = Duration.zero;
//         } else {
//           _playlistProvider.currentSongIndex =
//               (_playlistProvider.currentSongIndex! -
//                       1 +
//                       _playlistProvider.playlists.length) %
//                   _playlistProvider.playlists.length;
//         }
//         _isPlaying = false;
//       });
//       _loadSong();
//     }
//   }

//   void seek(Duration currentPosition) async {
//     await _audioPlayer.seek(currentPosition);
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   String _formatDuration(Duration duration) {
//     final minutes = duration.inMinutes.toString().padLeft(2, '0');
//     final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
//     return '$minutes:$seconds';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final currentSong = _playlistProvider.currentSongIndex != null
//         ? _playlistProvider.playlists[_playlistProvider.currentSongIndex!]
//         : null;

//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             // Background Image
//             Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/bg1.jpg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Power FM Extras',
//                 style: TextStyle(
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   shadows: [
//                     Shadow(
//                       blurRadius: 10.0,
//                       color: Colors.black.withOpacity(0.5),
//                       offset: const Offset(2.0, 2.0),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // Music Player UI
//             currentSong != null
//                 ? Column(
//                     children: [
//                       const Spacer(flex: 2),
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Image.asset(
//                           currentSong.albumArtImagePath,
//                           height: 300,
//                           width: 300,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       const Spacer(),
//                       Text(
//                         currentSong.songName,
//                         style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         currentSong.artistName,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       const SizedBox(height: 20),

//                       // Playback Slider
//                       Slider(
//                         value: _currentPosition.inSeconds.toDouble(),
//                         min: 0,
//                         max: _totalDuration.inSeconds > 0
//                             ? _totalDuration.inSeconds.toDouble()
//                             : 1, // Avoid zero max value
//                         activeColor: Colors.red,
//                         inactiveColor: Colors.grey,
//                         onChanged: (value) {
//                           seek(Duration(seconds: value.toInt()));
//                         },
//                       ),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             _formatDuration(_currentPosition),
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                           Text(
//                             _formatDuration(_totalDuration),
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),

//                       // Controls
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           IconButton(
//                             onPressed: _isLoaded ? _playPreviousSong : null,
//                             icon: const Icon(Icons.skip_previous),
//                             iconSize: 40,
//                             color: Colors.white,
//                           ),
//                           FloatingActionButton(
//                             backgroundColor: Colors.red,
//                             onPressed: _isLoaded ? _playPauseMusic : null,
//                             child: Icon(
//                               _isPlaying ? Icons.pause : Icons.play_arrow,
//                               size: 40,
//                             ),
//                           ),
//                           IconButton(
//                             onPressed: _isLoaded ? _playNextSong : null,
//                             icon: const Icon(Icons.skip_next),
//                             iconSize: 40,
//                             color: Colors.white,
//                           ),
//                         ],
//                       ),
//                       const Spacer(flex: 2),
//                     ],
//                   )
//                 : const Center(
//                     child: Text(
//                       "No Song Selected",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:powerfm/services/playlist_service.dart';

class ExtrasPage extends StatefulWidget {
  const ExtrasPage({Key? key}) : super(key: key);

  @override
  State<ExtrasPage> createState() => _ExtrasPageState();
}

class _ExtrasPageState extends State<ExtrasPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final PlaylistProvider _playlistProvider = PlaylistProvider();
  bool _isPlaying = false;
  bool _isLoaded = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _fetchAndLoadSongs();
    _setupAudioListeners();
  }

  Future<void> _fetchAndLoadSongs() async {
    await _playlistProvider.fetchAudioFiles();
    if (_playlistProvider.playlists.isNotEmpty) {
      _playlistProvider.currentSongIndex = 0; // Start with the first song
      _loadSong();
    }
  }

  void _setupAudioListeners() {
    // Listen to audio position changes
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _currentPosition = position;
      });
    });

    // Listen to the total duration of the current track
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _totalDuration = duration;
      });
    });

    // Listen for song completion
    _audioPlayer.onPlayerComplete.listen((_) => _playNextSong());
  }

  void _loadSong() async {
    if (_playlistProvider.currentSongIndex != null) {
      final currentSong =
          _playlistProvider.playlists[_playlistProvider.currentSongIndex!];
      await _audioPlayer.setSource(UrlSource(currentSong.audioUrl));
      setState(() {
        _isLoaded = true;
        _currentPosition = Duration.zero;
        _totalDuration = Duration.zero;
      });
    }
  }

  void _playPauseMusic() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.resume();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _playNextSong() {
    if (_playlistProvider.currentSongIndex != null) {
      _audioPlayer.stop();
      setState(() {
        _playlistProvider.currentSongIndex =
            (_playlistProvider.currentSongIndex! + 1) %
                _playlistProvider.playlists.length;
        _isPlaying = false;
      });
      _loadSong();
    }
  }

  void _playPreviousSong() {
    if (_playlistProvider.currentSongIndex != null) {
      _audioPlayer.stop();
      setState(() {
        // Restart current song if more than 2 seconds have played
        if (_currentPosition.inSeconds > 2) {
          _currentPosition = Duration.zero;
        } else {
          _playlistProvider.currentSongIndex =
              (_playlistProvider.currentSongIndex! -
                      1 +
                      _playlistProvider.playlists.length) %
                  _playlistProvider.playlists.length;
        }
        _isPlaying = false;
      });
      _loadSong();
    }
  }

  void seek(Duration currentPosition) async {
    await _audioPlayer.seek(currentPosition);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final currentSong = _playlistProvider.currentSongIndex != null
        ? _playlistProvider.playlists[_playlistProvider.currentSongIndex!]
        : null;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Power FM Extras',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),

            // Music Player UI
            currentSong != null
                ? Column(
                    children: [
                      const Spacer(flex: 2),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          currentSong.albumArtImagePath,
                          height: 300,
                          width: 300,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/default_album_art.jpg',
                              height: 300,
                              width: 300,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      const Spacer(),
                      Text(
                        currentSong.songName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        currentSong.artistName,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Playback Slider
                      Slider(
                        value: _currentPosition.inSeconds.toDouble(),
                        min: 0,
                        max: _totalDuration.inSeconds > 0
                            ? _totalDuration.inSeconds.toDouble()
                            : 1, // Avoid zero max value
                        activeColor: Colors.red,
                        inactiveColor: Colors.grey,
                        onChanged: (value) {
                          seek(Duration(seconds: value.toInt()));
                        },
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(_currentPosition),
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            _formatDuration(_totalDuration),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Controls
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: _isLoaded ? _playPreviousSong : null,
                            icon: const Icon(Icons.skip_previous),
                            iconSize: 40,
                            color: Colors.white,
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.red,
                            onPressed: _isLoaded ? _playPauseMusic : null,
                            child: Icon(
                              _isPlaying ? Icons.pause : Icons.play_arrow,
                              size: 40,
                            ),
                          ),
                          IconButton(
                            onPressed: _isLoaded ? _playNextSong : null,
                            icon: const Icon(Icons.skip_next),
                            iconSize: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const Spacer(flex: 2),
                    ],
                  )
                : const Center(
                    child: Text(
                      "No Song Selected",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
