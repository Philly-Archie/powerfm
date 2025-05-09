// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:powerfm/models/media_model.dart';

// class MediaProvider with ChangeNotifier {
//   List<Media> _mediaList = [];

//   List<Media> get mediaList => _mediaList;

//   Future<void> fetchMedia() async {
//     final url = Uri.parse('https://www.powerfm.co.ug/wp-json/wp/v2/media');
//     try {
//       print('Fetching media from $url...');
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         List<dynamic> data = json.decode(response.body);
//         _mediaList = data.map((item) => Media.fromJson(item)).toList();
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load media');
//       }
//     } catch (error) {
//       rethrow;
//     }
//   }
// }

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:powerfm/models/media_model.dart';

class WordPressService {
  final String baseUrl = 'https://www.powerfm.co.ug/wp-json/wp/v2/';

  Future<WordPressMedia> fetchVerseOfTheDay() async {
    final response = await http.get(
      Uri.parse('$baseUrl/media?per_page=1&orderby=date&order=desc'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        return WordPressMedia.fromJson(data[0]);
      } else {
        throw Exception('No media files found.');
      }
    } else {
      throw Exception('Failed to load verse of the day');
    }
  }
}
