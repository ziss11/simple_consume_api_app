import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_consume_api_app/data/models/article_model.dart';
import 'package:simple_consume_api_app/data/models/article_response.dart';
import 'package:simple_consume_api_app/utilities/constants.dart';

class ArticleRemoteDataSource {
  final http.Client _http;

  const ArticleRemoteDataSource(this._http);

  Future<List<ArticleModel>> getTopHeadlines() async {
    final response = await _http.get(Uri.parse(
        '$basedUrl?country=$country&category=$category&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      return ArticleResponse.fronJson(jsonDecode(response.body)).articleList;
    } else {
      throw Exception('Failed to get article data');
    }
  }
}
