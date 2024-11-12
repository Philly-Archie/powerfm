import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'play_page.dart';
import 'events_page.dart';
import 'extras_page.dart';
import 'about_page.dart';
import 'contacts_page.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  _BottomNavScreen createState() => _BottomNavScreen();
}


class _BottomNavScreen extends State<BottomNavScreen> {
  int selected = 2;
  final PageController controller = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            selected = index;
          });
        },
        children: [
          EventsPage(),
          ExtrasPage(),
          PlayPage(),
          ContactsPage(),
          AboutPage(),
        ],
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
            icon: const Icon(Icons.event_outlined),
            title: const Text('Events'),
            unSelectedColor: Colors.grey,
            selectedColor: Colors.blueAccent,
          ),
          BottomBarItem(
            icon: const Icon(Icons.extension_outlined),
            title: const Text('Extras'),
            unSelectedColor: Colors.grey,
            selectedColor: Colors.blueAccent,
          ),
          BottomBarItem(
            icon: const Icon(Icons.info_outline_rounded),
            title: const Text('About'),
            unSelectedColor: Colors.grey,
            selectedColor: Colors.grey,
          ),
          BottomBarItem(
            icon: const Icon(Icons.contact_mail_outlined),
            title: const Text('Contacts'),
            unSelectedColor: Colors.grey,
            selectedColor: Colors.blueAccent,
          ),
        ],
        fabLocation: StylishBarFabLocation.center,
        hasNotch: true,
        currentIndex: selected,
        onTap: (index) {
          if (index == selected) return;
          setState(() {
            selected = index;
            controller.jumpToPage(index);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.jumpToPage(2);
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(
          selected == 2 ? Icons.home : Icons.home_outlined,
          color: selected == 2 ? Colors.white : Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}