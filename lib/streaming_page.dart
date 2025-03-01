import 'package:flutter/material.dart';
import 'package:powerfm/audio_player_service.dart';

class StreamingPage extends StatefulWidget {
  const StreamingPage({super.key});

  @override
  State<StreamingPage> createState() => _StreamingPageState();
}

class _StreamingPageState extends State<StreamingPage> {
  final AudioPlayerService _audioPlayerService = AudioPlayerService();
  bool isPlaying = false;

  // void _togglePlayPause() {
  //   setState(() {
  //     if (isPlaying) {
  //       _audioPlayerService.playPause();
  //     } else {
  //       _audioPlayerService.playPause();
  //     }
  //     isPlaying = !isPlaying;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _audioPlayerService.playerStateStream.listen((state) {
      setState(() {
        isPlaying = state;
      });
    });
  }

  void _togglePlayPause() {
    setState(() {
      _audioPlayerService.playPause();
      isPlaying = !isPlaying;
    });
  }

  void _showLiveModeMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Can't move slider in live mode"),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.live_tv,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(width: 8),
            Text(
              "Stream Live",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/PFM Stream Design.jpg',
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Power FM Live',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Live from Studio',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("00:00", style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("00:00", style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
          Slider(
            value: 1,
            onChanged: (value) {
              _showLiveModeMessage();
            },
            onChangeStart: (value) {
              _showLiveModeMessage();
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.grey.shade300,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(isPlaying
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_fill),
                color: Colors.blue,
                iconSize: 64,
                onPressed: _togglePlayPause,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
