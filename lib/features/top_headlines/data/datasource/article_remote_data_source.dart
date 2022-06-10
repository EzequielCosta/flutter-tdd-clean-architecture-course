import 'package:dartz/dartz.dart';
import 'package:news/features/top_headlines/data/models/article_model.dart';

abstract class ArticleRemoteDataSource {
  Future<ArticleModel> getArticle(String? category, String? country);
}
