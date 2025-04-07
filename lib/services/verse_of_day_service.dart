// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:powerfm/models/verse_of_day_model.dart';

// class VerseOfDayProvider with ChangeNotifier {
//   VerseOfTheDay? _verseOfDay;
//   bool _isLoading = false;

//   VerseOfTheDay? get verseOfDay => _verseOfDay;
//   bool get isLoading => _isLoading;

//   List<VerseOfTheDay> _verseOfDayList = [];

//   List<VerseOfTheDay> get verseOfDayList => _verseOfDayList;

//   // Add this getter
//   VerseOfTheDay? get verseOfTheDay =>
//       _verseOfDayList.isNotEmpty ? _verseOfDayList.first : null;

//   Future<void> fetchVerseOfTheDay() async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       final url =
//           Uri.parse('https://www.powerfm.co.ug/wp-json/wp/v2/verseoftheday');
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final List<dynamic> data = json.decode(response.body);
//         if (data.isNotEmpty) {
//           _verseOfDay = VerseOfTheDay.fromJson(data.first);
//         }
//       } else {
//         throw Exception('Failed to load verse of the day');
//       }
//     } catch (error) {
//       rethrow;
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/bible_verse.dart';
import '../models/media_model.dart';

class VerseOfDayProvider with ChangeNotifier {
  WordPressMedia? _verseOfTheDay;
  BibleVerse? _bibleVerse;

  WordPressMedia? get verseOfTheDay => _verseOfTheDay;
  BibleVerse? get bibleVerse => _bibleVerse;

  Future<void> fetchVerseOfTheDay() async {
    final url =
        'https://www.powerfm.co.ug/wp-json/wp/v2/media?per_page=1&orderby=date&order=desc';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        _verseOfTheDay = WordPressMedia.fromJson(data[0]);
        notifyListeners();
      }
    } else {
      throw Exception('Failed to load verse of the day');
    }
  }

  Future<void> fetchBibleVerse(String reference) async {
    // Fetch the verse from the Bible API
    final bibleResponse =
        await http.get(Uri.parse('https://bible-api.com/$reference'));

    if (bibleResponse.statusCode == 200) {
      final bibleData = json.decode(bibleResponse.body);
      _bibleVerse = BibleVerse.fromJson(bibleData);
      notifyListeners();
    } else {
      throw Exception('Failed to load Bible verse');
    }
  }
}
