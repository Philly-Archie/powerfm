import 'package:flutter/material.dart';

class VerseDetailScreen extends StatelessWidget {
  final String verseReference;
  final String verseText;
  final String imageUrl;

  const VerseDetailScreen({
    required this.verseReference,
    required this.verseText,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(verseReference),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image at the top
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // Verse text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                verseText,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Additional details (e.g., translation)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Translation: World English Bible',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
