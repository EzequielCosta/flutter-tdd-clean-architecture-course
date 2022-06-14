import 'package:equatable/equatable.dart';
import 'package:news/features/top_headlines/domain/entities/source.dart';

class Article extends Equatable {
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;
  final Source source;

  const Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.source,
  });

  @override
  List<Object?> get props => [author, title, description, content];
}
