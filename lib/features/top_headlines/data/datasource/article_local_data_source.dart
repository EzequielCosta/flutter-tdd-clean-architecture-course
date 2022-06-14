import 'package:news/features/top_headlines/data/models/article_model.dart';
import 'package:news/features/top_headlines/data/models/articles_model.dart';

abstract class ArticleLocalDataSource {
  Future<ArticlesModel> getOldNews();
  Future<void> cacheNew(ArticlesModel article);
}
