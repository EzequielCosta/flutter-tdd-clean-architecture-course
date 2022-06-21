import 'package:news/features/top_headlines/data/models/article_model.dart';
import 'package:news/features/top_headlines/data/models/articles_model.dart';

abstract class ArticleLocalDataSource {
  Future<ArticlesModel> getNewsCached();
  Future<void> cacheNews(ArticlesModel articles);
}
