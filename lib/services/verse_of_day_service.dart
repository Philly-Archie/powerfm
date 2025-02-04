import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:powerfm/models/verse_of_day_model.dart';

class VerseOfDayProvider with ChangeNotifier {
  List<VerseOfTheDay> _verseOfDayList = [];

  List<VerseOfTheDay> get verseOfDayList => _verseOfDayList;

  Future<void> fetchVerseOfTheDay() async {
    final url =
        Uri.parse('https://www.powerfm.co.ug/wp-json/wp/v2/verseoftheday');
    try {
      print('Fetching verse of the day from $url...');

      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        _verseOfDayList =
            data.map((item) => VerseOfTheDay.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load media');
      }
    } catch (error) {
      rethrow;
    }
  }
}
