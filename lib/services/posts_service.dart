import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:powerfm/models/posts_model.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];
  List<Post> get posts => _posts;

  Future<void> fetchPosts() async {
    final url = Uri.parse('https://www.powerfm.co.ug/wp-json/wp/v2/posts');
    try {
      print('Fetching posts from $url...');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        _posts = data.map((item) => Post.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (error) {
      rethrow;
    }
  }
}
