import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/features/top_headlines/domain/entities/article.dart';

abstract class ArticleRepository {
  // Future<Either<Failure, Article>> getArticleByCountry(
  //     [String? country = 'us']);
  Future<Either<Failure, Article>> getArticle(
      {String? category, String? country});
}
