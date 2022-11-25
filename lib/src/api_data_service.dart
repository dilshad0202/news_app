import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/src/article_model.dart';

class ApiService {
static String api = "https://saurav.tech/NewsAPI/everything/cnn.json";

 static  Future<List<Article>> getData() async {
    List<Article> articles = [];
    try {
      Uri url = Uri.parse(api);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        articles = json
            .decode(response.body)["articles"]
            .cast<Map<String, dynamic>>()
            .map<Article>((json) => Article.fromJson(json))
            .toList();
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
    return articles;
  }
}
