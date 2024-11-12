import 'package:flutter/material.dart';
import 'audio_player_service.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({super.key});

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  final AudioPlayerService _audioPlayerService = AudioPlayerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 200, width: 80,),
            const SizedBox(width: 20),
            const Text(
              'Power FM',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPlayerSection(),
              const SizedBox(height: 16),
              _buildHorizontalSection1('Last Played', [
                _buildCard('God Only Knows', 'for KING + COUNTRY', 'assets/images/pic4.jpg'),
                _buildCard('To Be Announced', 'Artist Name', 'assets/images/pic1.jpg'),
                _buildCard('Another Song', 'Another Artist', 'assets/images/pic3.jpg'),
              ]),
              const SizedBox(height: 16,),
              _buildHorizontalSection('New This Week', [
                _buildVerticalCard('Watch Live Performance', 'Seph Schlueter', 'assets/images/pic5.jpg'),
                _buildVerticalCard('K-LOVE Artists Performance', 'Read + Listen', 'assets/images/pic6.jpg'),
              ]),

              _buildHorizontalSection('Music All-Access', [
                _buildVerticalCard(
                    'Elevation Worship Praises', 'God Is not Against us', 'assets/images/pic7.jpg'),
                _buildVerticalCard(
                    'Elevation Worship Praises', 'God Is not Against us','assets/images/pic1.jpg'),
              ]),
              _buildHorizontalSection('Top Played', [
                _buildVerticalCard('Watch Live Performance', 'Seph Schlueter', 'assets/images/pic4.jpg'),
                _buildVerticalCard(
                    'K-LOVE Artists Performance', 'Read + Listen', 'assets/images/pic5.jpg'),
              ]),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildPlayerSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background image layer
          Positioned.fill(
            child: Image.asset(
                'assets/images/pic3.jpg',
                fit: BoxFit.cover,
              ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
            ),
            padding: const EdgeInsets.only(left: 8.0, right: 80.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('If I Got Jesus', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                Text('Ben Fuller', style: TextStyle(color: Colors.black54, fontSize: 20)),
              ],
            ),
          ),
          Positioned(
            bottom: -20,
            right: 10,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blueAccent,
                  width: 2,
                ),
              ),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _audioPlayerService.playPause();
                  });
                },
                backgroundColor: Colors.white,
                elevation: 0,
                child: Icon(
                  _audioPlayerService.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildHorizontalSection(String title, List<Widget> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: cards,
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalSection1(String title, List<Widget> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: cards,
          ),
        ),
      ],
    );
  }


  Widget _buildCard(String title, String subtitle, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildVerticalCard(String title, String subtitle, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}