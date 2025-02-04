import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:powerfm/models/event_model.dart';

class EventProvider with ChangeNotifier {
  List<Event> _events = [];
  List<Event> get events => _events;

  Future<void> fetchEvents() async {
    final url = Uri.parse('https://www.powerfm.co.ug/wp-json/wp/v2/pf-event');
    try {
      print('Fetching events from $url...');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        _events = data.map((item) => Event.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load events');
      }
    } catch (error) {
      throw error;
    }
  }
}
