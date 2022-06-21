import 'dart:convert';

import 'package:news/core/error/exception.dart';
import 'package:news/features/top_headlines/data/datasource/article_remote_data_source.dart';
import 'package:news/features/top_headlines/data/models/articles_model.dart';
import 'package:news/features/top_headlines/domain/usecases/get_article.dart';
import 'package:http/http.dart' as http;

class ArticleRemoteDataSourceImplementation extends ArticleRemoteDataSource {
  final http.Client client;
  String _uri = 'https://newsapi.org/v2/top-headlines';
  String _apiKey = '09d6f7340834466bac10c8f1e1de119b';

  ArticleRemoteDataSourceImplementation({required this.client});

  @override
  Future<ArticlesModel> getArticle(String? category, String? country) async {
    String search = '';
    if (category != null) {
      search += '&category=$category';
    } else if (country != null) {
      search += '&country=$country';
    }

    String url = '$_uri?apiKey=$_apiKey$search';

    http.Response response = await client.get(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }

    return ArticlesModel.fromJson(jsonDecode(response.body));
  }
}
