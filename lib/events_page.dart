import 'package:flutter/material.dart';
import 'package:powerfm/event_details.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 100, width: 80),
            const SizedBox(width: 16),
            const Text(
              'Events',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Upcoming Events'),
              _buildEventCard(
                context,
                'PHATFEST 2023',
                'December 09, 2023',
                'As we celebrate 25 years of Power Fm, lookout for Phatfest which will happen on 9th December this year.',
                'Phatfest is a Gospel Event hosted by Power 104.1 FM, Uganda’s leading English, Urban, Youthful Christian Radio. It was launched in 2009 as part of Power FM’s 10 year anniversary celebrations and over the past years, Phatfest has been graced by Top flight gospel Artistes in Uganda, East Africa, Africa and International acts like former Sudanese child soldier Emmanuel Jal, Sherwin Gardner, Isaac Blackman, Michelle Bonilla, Sho Baraka, Benjah, Da Truth, P4CM and Lil Million. This Year, Phatfest is back and is like no other. Follow us on our Social Media Pages for the surprises coming soon concerning Phatfest.',
                'assets/images/PhatFest-2023-Web.jpg',
              ),
              _buildEventCard(
                context,
                'Easter In Prison | Redemptive Love',
                'March 28, 2024',
                'Every year, we are privileged to take a message of hope to prisoners.',
                'Every year, we are privileged to take a message of hope to prisoners in various detention centers in the country. This year, we are heading to the Kirinya Prison Complex in Jinja, to take a message of Redemptive Love and we would love you to join us as we practically love on them. With a contribution of 40k or more and items in kind, you can put a smile on the faces of these prisoners and remind them that they are loved & not forgotten.',
                'assets/images/1x1-Version-0-00-00-00.jpg',
              ),
              _buildEventCard(
                context,
                'Christmas Cheer',
                'May 5, 2024',
                'Christmas carols, love, and gifts.',
                'Christmas carols about King Jesus, love, gifts, real & synthetic trees, trinkets and tidbits occupy our minds as we approach Christmas day. We plan to meet up with our families and friends over home cooked meals, with laughter and love filling our hearts. This is what Christmas should be and is for a lot of people, but there are those who are not so fortunate and find themselves not experiencing the ‘cheer’ that’s in the air. During Christmas Cheer, Power Fm visits those who are having a less than ‘merry Christmas’ to show them that Jesus has them on His mind and we are His hands and feet in spreading His love to them. In 2022, we visited the children of Dorna Centre for Children with Autism and had a lovely time with them. Through your generosity, we were able to purchase some much-needed items with the school. Look out for the next activation so you can know how to participate.',
                'assets/images/PowerfFm-Events-christmas-cheer.jpg',
              ),
              const SizedBox(height: 16),
              _buildHorizontalSection('Past Events', [
                _buildVerticalCard(
                  context,
                  'Artist Workshop',
                  'Power 104.1 Fm is a music radio station. This means that most of our programming will feature more music than talk. The Artiste workshop is our way of equipping the artistes, both established and upcoming, with skills and tools that can help them develop into world-class artistes. We do this through organizing talks and practical sessions with the industry’s finest experts in songwriting, music production, branding, music business and most importantly, discipleship. Look out for the next artiste workshop as we partner with you to develop the gospel music industry in Uganda',
                  'assets/images/Powerfm-artist-workshop.jpg',
                ),
                _buildVerticalCard(
                  context,
                  'PHATFEST',
                  'Phatfest is a Gospel Event hosted by Power 104.1 FM, Uganda’s leading English, Urban, Youthful Christian Radio. It was launched in 2009 as part of Power FM’s 10 year anniversary celebrations and over the past years, Phatfest has been graced by Top flight gospel Artistes in Uganda, East Africa, Africa and International acts like former Sudanese child soldier Emmanuel Jal, Sherwin Gardner, Isaac Blackman, Michelle Bonilla, Sho Baraka, Benjah, Da Truth, P4CM and Lil Million. This Year, Phatfest is back and is like no other. Follow us on our Social Media Pages for the surprises coming soon concerning Phatfest.',
                  'assets/images/PhatFest-2023-Web.jpg',
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, String title, String date,
      String shortDescription, String fullDescription, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              title: title,
              date: date,
              description: fullDescription,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  shortDescription,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
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
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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

  Widget _buildVerticalCard(
      BuildContext context, String title, String subtitle, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              title: title,
              date: '',
              description: subtitle,
              imageUrl: imagePath,
            ),
          ),
        );
      },
      child: Padding(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
      ),
    );
  }
}
