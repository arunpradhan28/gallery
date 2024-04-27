import 'dart:convert';
import 'package:http/http.dart' as http;

class PixabayService {
  final String apiKey = '43599108-f67bc2b396ad323e540b1a11d';
  final String baseUrl = 'https://pixabay.com/api/';

  Future<List<Map<String, dynamic>>> fetchImages(String query, int page) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl?key=$apiKey&q=$query&page=$page'));

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);
        if (data is Map<String, dynamic> && data.containsKey('hits')) {
          return List<Map<String, dynamic>>.from(data['hits']);
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to load images: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching images: $e');
      throw Exception('Failed to load images');
    }
  }
}
