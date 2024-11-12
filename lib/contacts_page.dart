import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: const Center(
        child: Text(
          'About Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}


//
//
// import 'package:flutter/material.dart';
//
// class ContactsPage extends StatelessWidget {
//   const ContactsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Contacts'),
//         centerTitle: true,
//         backgroundColor: Colors.blue, // Adjust as needed
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildButtonSection(),
//               const SizedBox(height: 20),
//               _buildSectionTitle('Contact Us'),
//               _buildContactCard('Call Us', Icons.phone),
//               _buildContactCard('Email Us', Icons.email),
//               _buildContactCard('App Feedback', Icons.feedback),
//               const SizedBox(height: 20),
//               _buildSectionTitle('Links'),
//               _buildContactCard('KLOVE.com', Icons.link),
//               _buildContactCard('K-LOVE On Demand', Icons.video_library),
//               _buildContactCard('Sweepstakes & Text Club', Icons.message),
//               const SizedBox(height: 20),
//               _buildSectionTitle('Legal Info'),
//               _buildContactCard('Privacy Policy', Icons.privacy_tip),
//               _buildContactCard('Terms of Use', Icons.description),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildButtonSection() {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           // Handle button press logic
//         },
//         style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
//         ),
//         child: const Text(
//           'Sign in or create account',
//           style: TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Text(
//         title,
//         style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
//
//   Widget _buildContactCard(String title, IconData icon) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: ListTile(
//         leading: Icon(icon, color: Colors.blue),
//         title: Text(title),
//         trailing: const Icon(Icons.chevron_right),
//         onTap: () {
//           // Handle tap logic
//         },
//       ),
//     );
//   }
// }
