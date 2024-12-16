// import 'package:flutter/material.dart';
// import 'package:powerfm/contacts.dart';

// class AboutPage extends StatelessWidget {
//   const AboutPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('About Us'),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildSectionTitle('Who We Are'),
//               _buildDescriptionText(
//                 'Power 104.1 FM is the go-to station for wholesome, inspirational programming that stretches beyond entertainment. At Power FM, we are out to transform lives positively for Jesus. Our programming is designed to reach the young and the young at heart.',
//               ),
//               const SizedBox(height: 20),
//               _buildSectionTitle('Our Vision'),
//               _buildDescriptionText(
//                 'We are an English-speaking Christian radio station, transforming culture with the Love of Christ, by reaching urban youth through wholesome, inspirational programming.',
//               ),
//               const SizedBox(height: 20),
//               _buildSectionTitle('Our Values'),
//               _buildValuesList(),
//               const SizedBox(height: 20),
//               _buildSectionTitle('On-Air'),
//               _buildDescriptionText(
//                 'Listen to us 24/7 on the radio frequency 104.1 in and around Kampala! Get to know us more or reach out to us here.',
//               ),
//               _buildActionButton('Listen Live', () {
//                 // Add logic to launch live stream or link
//               }),
//               const SizedBox(height: 20),
//               _buildSectionTitle('On-Site'),
//               _buildDescriptionText(
//                 'Look out for our events like Movie Nights, Power FM Presents, Easter in Prison, and Christmas Cheer among others to connect with the Power FM team. Get to know us more or reach out to us here.',
//               ),
//               _buildActionButton('Contact Us', () {
//                 // Navigate to the contact page
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const ContactsPage()),
//                 );
//               }),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Text(
//         title,
//         style: const TextStyle(
//             fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
//       ),
//     );
//   }

//   Widget _buildDescriptionText(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: Text(
//         text,
//         style: const TextStyle(fontSize: 16, color: Colors.black87),
//       ),
//     );
//   }

//   Widget _buildValuesList() {
//     return Column(
//       children: [
//         _buildValueItem('Christ'),
//         _buildValueItem('Excellence'),
//         _buildValueItem('Creativity'),
//         _buildValueItem('Integrity'),
//         _buildValueItem('Community'),
//       ],
//     );
//   }

//   static Widget _buildValueItem(String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           const Icon(Icons.check_circle_outline, color: Colors.blue, size: 20),
//           const SizedBox(width: 10),
//           Text(
//             value,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildActionButton(String label, VoidCallback onPressed) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
//         backgroundColor: Colors.blueAccent,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       ),
//       child: Text(
//         label,
//         style: const TextStyle(fontSize: 16, color: Colors.white),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:powerfm/contacts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Who We Are'),
              _buildDescriptionText(
                'Power 104.1 FM is the go-to station for wholesome, inspirational programming that stretches beyond entertainment. At Power FM, we are out to transform lives positively for Jesus. Our programming is designed to reach the young and the young at heart.',
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Our Vision'),
              _buildDescriptionText(
                'We are an English-speaking Christian radio station, transforming culture with the Love of Christ, by reaching urban youth through wholesome, inspirational programming.',
              ),
              const SizedBox(height: 20),
              _buildVisionRow(),
              const SizedBox(height: 20),
              _buildSectionTitle('Our Values'),
              _buildValuesList(),
              const SizedBox(height: 20),
              _buildSectionTitle('On-Air'),
              _buildDescriptionText(
                'Listen to us 24/7 on the radio frequency 104.1 in and around Kampala! Get to know us more or reach out to us here.',
              ),
              _buildOnAirRow(),
              const SizedBox(height: 20),
              _buildActionButton('Listen Live', () {
                // Add logic to launch live stream or link
              }),
              const SizedBox(height: 20),
              _buildSectionTitle('On-Site'),
              _buildDescriptionText(
                'Look out for our events like Movie Nights, Power FM Presents, Easter in Prison, and Christmas Cheer among others to connect with the Power FM team. Get to know us more or reach out to us here.',
              ),
              _buildOnSiteRow(),
              _buildActionButton('Contact Us', () {
                // Navigate to the contact page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactsPage()),
                );
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  Widget _buildDescriptionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }

  Widget _buildVisionRow() {
    return Row(
      children: [
        Image.asset(
          'assets/images/pic3.jpg', // Replace with your asset path
          width: 150,
          height: 150,
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our Vision',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'We are an English-speaking Christian radio station, transforming culture with the Love of Christ, by reaching urban youth through wholesome, inspirational programming.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildValuesList() {
    return Column(
      children: [
        _buildValueItem('Christ'),
        _buildValueItem('Excellence'),
        _buildValueItem('Creativity'),
        _buildValueItem('Integrity'),
        _buildValueItem('Community'),
      ],
    );
  }

  static Widget _buildValueItem(String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.blue, size: 20),
          const SizedBox(width: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildOnAirRow() {
    return Row(
      children: [
        Image.asset(
          'assets/images/pic2.jpg',
          width: 150,
          height: 150,
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'On-Air',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Listen to us 24/7 on the radio frequency 104.1 in and around Kampala! Get to know us more or reach out to us here.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOnSiteRow() {
    return Row(
      children: [
        Image.asset(
          'assets/images/pic1.jpg',
          width: 150,
          height: 150,
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'On-Site Events',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Look out for our events like Movie Nights, Power FM Presents, Easter in Prison, and Christmas Cheer among others to connect with the Power FM team.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
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
