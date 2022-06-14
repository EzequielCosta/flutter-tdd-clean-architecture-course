import 'package:dartz/dartz_unsafe.dart';
import 'package:news/features/top_headlines/data/models/article_model.dart';
import 'package:news/features/top_headlines/domain/entities/article.dart';
import 'package:news/features/top_headlines/domain/entities/articles.dart';
import 'package:news/features/top_headlines/domain/entities/source.dart';

class ArticlesModel extends Articles {
  late List<Article> _articles;
  ArticlesModel([List<Article> articles = const []]) {
    _articles = articles;
  }

  factory ArticlesModel.toJson(List<dynamic> json) {
    List<Article> articles = [];
    for (Map<String, dynamic> article in json) {
      articles.add(ArticleModel.toJson(article)
          // Article(
          // author: article["author"],
          // title: article["title"],
          // description: article["description"],
          // url: article["url"],
          // urlToImage: article["urlToImage"],
          // publishedAt: article["publishedAt"],
          // content: article["content"],
          // source: Source(
          //     id: article["source"]["id"], name: article["source"]["name"]),)
          );
    }
    return ArticlesModel(articles);
  }
}
