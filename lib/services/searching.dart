import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiKey;
  final String baseUrl = "https://newsapi.org/v2/top-headlines";

  NewsService(this.apiKey);

  Future<List<Map<String, dynamic>>> searchNews(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl?q=$query&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['status'] == 'ok') {
        return List<Map<String, dynamic>>.from(data['articles']);
      } else {
        throw Exception('Failed to load news');
      }
    } else {
      throw Exception('Failed to load news');
    }
  }
}
