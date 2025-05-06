import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiKey = 'kay'; // Sua chave de API
  final String baseUrl = 'url';

  Future<List<Map<String, dynamic>>> fetchNews() async {
    final url = Uri.parse('$baseUrl?q=example&lang=en&country=us&max=10&apikey=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print (response.body);
      return List<Map<String, dynamic>>.from(data['articles']);
    } else {
      throw Exception('Falha ao carregar notícias');
    }
  }
}
