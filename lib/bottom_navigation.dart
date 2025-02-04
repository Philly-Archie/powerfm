import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'play_page.dart';
import 'events_page.dart';
import 'extras_page.dart';
import 'contacts.dart';
import 'streaming_page.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  _BottomNavScreen createState() => _BottomNavScreen();
}

class _BottomNavScreen extends State<BottomNavScreen> {
  int selected = 2;
  final PageController controller = PageController(initialPage: 2);
  bool hidePlayPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (_) {},
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              selected = index;
            });
          },
          physics: const NeverScrollableScrollPhysics(),
          children: [
            if (!hidePlayPage) const PlayPage(),
            const ExtrasPage(),
            const StreamingPage(),
            const EventsPage(),
            const ContactsPage(),
          ],
        ),
      ),
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          iconSize: 30,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.simple,
          opacity: 0.5,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            unSelectedColor: Colors.grey,
            selectedColor: Colors.black,
          ),
          BottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text('Extras'),
            unSelectedColor: Colors.grey,
            selectedColor: Colors.black,
          ),
          if (!hidePlayPage)
            BottomBarItem(
              icon: const Icon(Icons.play_circle),
              title: const Text('Play'),
              unSelectedColor: Colors.white,
              selectedColor: Colors.white,
            ),
          BottomBarItem(
            icon: const Icon(Icons.notifications),
            title: const Text('Events'),
            unSelectedColor: Colors.grey,
            selectedColor: Colors.black,
          ),
          BottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Contacts'),
            unSelectedColor: Colors.grey,
            selectedColor: Colors.black,
          ),
        ],
        fabLocation: StylishBarFabLocation.center,
        hasNotch: true,
        currentIndex: selected,
        onTap: (index) {
          if (index == selected)
            return; // Prevent re-selection of the current page
          setState(() {
            selected = index; // Update selected page index
            controller.jumpToPage(index); // Navigate to the selected page
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.jumpToPage(2); // Navigate to PlayPage when FAB is pressed
        },
        backgroundColor: Colors.white,
        child: Icon(
          selected == 2
              ? Icons.play_circle_fill
              : Icons.play_circle_fill_outlined,
          color: selected == 2 ? Colors.black : Colors.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
