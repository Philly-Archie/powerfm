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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 210,
                  child: AppBar(
                    toolbarHeight: 100,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              height: 150,
                              width: 70,
                            ),
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
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 6.0,
                              ),
                            ),
                            child: const Row(
                              children: [
                                Text(
                                  "Extras",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 2),
                                Icon(
                                  Icons.arrow_downward_outlined,
                                  color: Colors.black,
                                  size: 14, // Smaller icon size
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.blue,
                    centerTitle: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 70),
                      _buildHorizontalSection1('Last Played', [
                        _buildCard('God Only Knows', 'for KING + COUNTRY', 'assets/images/pic4.jpg'),
                        _buildCard('To Be Announced', 'Artist Name', 'assets/images/pic1.jpg'),
                        _buildCard('Another Song', 'Another Artist', 'assets/images/pic3.jpg'),
                      ]),
                      const SizedBox(height: 16),
                      _buildHorizontalSection('New This Week', [
                        _buildVerticalCard('Watch Live Performance', 'Seph Schlueter', 'assets/images/pic5.jpg'),
                        _buildVerticalCard('K-LOVE Artists Performance', 'Read + Listen', 'assets/images/pic6.jpg'),
                      ]),
                      _buildHorizontalSection('Top Played', [
                        _buildVerticalCard('Watch Live Performance', 'Seph Schlueter', 'assets/images/pic4.jpg'),
                        _buildVerticalCard(
                            'K-LOVE Artists Performance', 'Read + Listen', 'assets/images/pic5.jpg'),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
            // Overlapping Card
            Positioned(
              top: 80,
              left: 16,
              right: 16,
              child: _buildPlayerSection(),
            ),
          ],
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
          // Background image
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/pic3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Opacity overlay container
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
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
          // Floating action button
          Positioned(
            bottom: -30,
            right: 60,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _audioPlayerService.playPause();
                });
              },
              backgroundColor: Colors.white,
              elevation: 2,
              shape: const CircleBorder(
                side: BorderSide(
                  color: Colors.blueAccent,
                  width: 2,
                ),
              ),
              child: Icon(
                _audioPlayerService.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.blueAccent,
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