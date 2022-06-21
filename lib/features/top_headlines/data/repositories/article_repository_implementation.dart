import 'package:dartz/dartz.dart';
import 'package:news/core/error/exception.dart';
import 'package:news/core/error/failures.dart';
import 'package:news/core/platform/network_info.dart';
import 'package:news/features/top_headlines/data/datasource/article_local_data_source.dart';
import 'package:news/features/top_headlines/data/datasource/article_remote_data_source.dart';
import 'package:news/features/top_headlines/data/models/article_model.dart';
import 'package:news/features/top_headlines/data/models/articles_model.dart';
import 'package:news/features/top_headlines/domain/entities/article.dart';
import 'package:news/features/top_headlines/domain/entities/articles.dart';
import 'package:news/features/top_headlines/domain/repositories/article_repository.dart';

class ArticleRepositoryImplementation implements ArticleRepository {
  final ArticleRemoteDataSource remoteDataSource;
  final ArticleLocalDataSource localDataSource;
  final NetWorkInfo networkInfo;

  ArticleRepositoryImplementation(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Articles>> getArticle(
      {String? category, String? country}) async {
    bool isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        ArticlesModel modelResponse =
            await remoteDataSource.getArticle(category, country);
        localDataSource.cacheNews(modelResponse);
        return Right(modelResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }

    return Right(await localDataSource.getNewsCached());
  }

  Future<bool> isConnected() async {
    return await networkInfo.isConnected;
  }
}
