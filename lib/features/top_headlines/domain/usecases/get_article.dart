import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/core/usecases/usecase.dart';
import 'package:news/features/top_headlines/domain/entities/article.dart';
import 'package:news/features/top_headlines/domain/entities/articles.dart';
import 'package:news/features/top_headlines/domain/repositories/article_repository.dart';

class GetArticle extends UseCase<Articles, Params> {
  final ArticleRepository articleRepository;

  GetArticle({required this.articleRepository});

  @override
  Future<Either<Failure, Articles>> call(Params params) async {
    return await articleRepository.getArticle(
        category: params.category, country: params.country);
  }
}

class Params extends Equatable {
  final String? category;
  final String? country;

  const Params({required this.category, required this.country});

  @override
  List<Object?> get props => [category, country];
}
