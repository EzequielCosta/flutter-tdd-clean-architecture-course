import 'package:news/features/top_headlines/domain/entities/article.dart';

class Articles {
  late List<Article> _articles;
  Articles([List<Article> articles = const []]) {
    _articles = articles;
  }

  void add(Article article) {
    _articles.add(article);
  }

  void remove(Article article) {
    _articles.remove(article);
  }
}
