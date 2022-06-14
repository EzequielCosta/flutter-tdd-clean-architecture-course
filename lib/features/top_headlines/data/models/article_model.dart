import 'package:news/features/top_headlines/data/models/source_model.dart';
import 'package:news/features/top_headlines/domain/entities/article.dart';
import 'package:news/features/top_headlines/domain/entities/source.dart';

class ArticleModel extends Article {
  @override
  final String? author;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String url;
  @override
  final String? urlToImage;
  @override
  final DateTime publishedAt;
  @override
  final String? content;
  @override
  final Source source;

  const ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.source,
  }) : super(
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
          source: source,
        );

  factory ArticleModel.toJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json["author"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: DateTime.parse(json["publishedAt"]),
      content: json["content"],
      source: SourceModel.toJson(json["source"]),
    );
  }
}
