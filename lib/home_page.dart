import 'package:flutter/material.dart';
import 'package:powerfm/services/verse_of_day_service.dart';
import 'package:provider/provider.dart';
import 'streaming_page.dart';
import 'audio_player_service.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({super.key});

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  final AudioPlayerService _audioPlayerService = AudioPlayerService();

  @override
  void initState() {
    super.initState();
    // Fetch the data when the screen initializes
    Future.microtask(() =>
        Provider.of<VerseOfDayProvider>(context, listen: false)
            .fetchVerseOfTheDay());
  }

  @override
  Widget build(BuildContext context) {
    final verseProvider = Provider.of<VerseOfDayProvider>(context);
    final verseData = verseProvider.verseOfTheDay;
    print('Verse Data: ${verseData?.title.rendered}');

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // AppBar Section
            Container(
              child: AppBar(
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Search Bar Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.menu, color: Colors.grey[600]),
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        suffixIcon: Icon(Icons.search, color: Colors.grey[600]),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // PlayerCard Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildPlayerSection(),
            ),

            // Rest of the Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHorizontalSection1([
                    _buildCard('PowerFm Extra', 'assets/images/streaming3.jpg',
                        context, 1),
                    _buildCard('Partner With Us',
                        'assets/images/streaming2.jpg', context, 4),
                  ]),
                  const SizedBox(height: 16),
                  _buildHorizontalSection('Verse Of The Day', [
                    SizedBox(
                      width: MediaQuery.of(context)
                          .size
                          .width, // Adjust width as needed
                      // child: Consumer<VerseOfDayProvider>(
                      //   builder: (context, verseProvider, child) {
                      //     final verseData = verseProvider.verseOfTheDay;

                      //     if (verseData == null) {
                      //       return Text("Loading...");
                      //     }

                      //     print(
                      //         'Verse Title: ${verseData.title}'); // Debugging log

                      //     return _buildVerseCard(
                      //       context,
                      //       verseData.title.rendered, // Correct access
                      //       verseData.content.rendered,
                      //       'assets/images/pic5.jpg',
                      //     );
                      //   },

                      child: _buildVerseCard(
                        // context,
                        // verseData?.title.rendered ?? 'Loading...',
                        // verseData?.content.rendered ?? '',
                        // 'assets/images/pic5.jpg',
                        context,
                        "Son of man, what is this proverb you have in the land of Israel: ‘The days go by and every vision comes to nothing’? Say to them, ‘This is what the Sovereign Lord says: I am going to put an end to this proverb, and they will no longer quote it in Israel.’ Say to them, ‘The days are near when every vision will be fulfilled.",
                        'Ezekiel 12:22-23 NIV',
                        'assets/images/vod.jpg',
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage('assets/images/streaming1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Opacity overlay container
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16.0),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Stream Live',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Live Radio: Your Sound, Your Radio Station!',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Play button
                      FloatingActionButton(
                        onPressed: () {
                          //Navigate to streaming page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StreamingPage()),
                          );

                          // setState(() {
                          //   _audioPlayerService.playPause();
                          // });
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
                          _audioPlayerService.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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

  Widget _buildHorizontalSection1(List<Widget> cards) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cards,
      ),
    );
  }

  Widget _buildCard(
      String title, String imagePath, BuildContext context, int index) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StreamingPage(),
          ),
        );
      },
      child: SizedBox(
        width: screenWidth / 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVerseCard(
      BuildContext context, String verse, String reference, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Left Side - Image with rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 200,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Container(
              width: 200, // Set a fixed width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    verse,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    reference,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey, // Faded look for reference
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
