import 'package:dartz/dartz.dart';
import 'package:news/features/top_headlines/data/models/article_model.dart';
import 'package:news/features/top_headlines/data/models/articles_model.dart';

abstract class ArticleRemoteDataSource {
  Future<ArticlesModel> getArticle(String? category, String? country);
}
