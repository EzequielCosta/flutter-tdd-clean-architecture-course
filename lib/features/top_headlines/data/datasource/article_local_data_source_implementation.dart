import 'dart:convert';

import 'package:news/features/top_headlines/data/datasource/article_local_data_source.dart';
import 'package:news/features/top_headlines/data/models/articles_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cachedNews = 'CACHED_NEWS';

class ArticleLocalDataSourceImplementation extends ArticleLocalDataSource {
  late SharedPreferences sharedPreferences;
  ArticleLocalDataSourceImplementation({required this.sharedPreferences});

  @override
  Future<ArticlesModel> getNewsCached() async {
    String jsonString = sharedPreferences.get(cachedNews) as String;
    return ArticlesModel.fromJson(jsonDecode(jsonString));
  }

  @override
  Future<void> cacheNews(ArticlesModel articles) async {
    sharedPreferences.setString(cachedNews, articles.toJson());
  }
}
