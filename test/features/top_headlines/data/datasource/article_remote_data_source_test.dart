import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:news/core/error/exception.dart';
import 'package:news/features/top_headlines/data/datasource/article_remote_data_source_implementation.dart';
import 'package:news/features/top_headlines/data/models/articles_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpCliente extends Mock implements http.Client {}

void main() {
  late final ArticleRemoteDataSourceImplementation
      articleRemoteDataSourceImplentation;
  late final MockHttpCliente mockHttpClient;
  final ArticlesModel articlesModels =
      ArticlesModel.fromJson(jsonDecode(fixture("news_cached.json")));
  String url =
      'https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=09d6f7340834466bac10c8f1e1de119b';

  setUp(() {
    mockHttpClient = MockHttpCliente();
    articleRemoteDataSourceImplentation =
        ArticleRemoteDataSourceImplementation(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(() =>
            mockHttpClient.get(Uri.parse(url), headers: any(named: "headers")))
        .thenAnswer(
            (_) async => http.Response(fixture("news_cached.json"), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(() =>
            mockHttpClient.get(Uri.parse(url), headers: any(named: "headers")))
        .thenAnswer((_) async => http.Response('Not found', 404));
  }

  group("Test remote datasource", () {
    test(
      'should preform a GET request on a URL with number being the endpoint and with application/json header',
      () {
        //arrange
        setUpMockHttpClientSuccess200();

        // act
        articleRemoteDataSourceImplentation.getArticle("technology", "us");

        // assert
        verify() => mockHttpClient.get(
              Uri.parse(url),
              headers: {'Content-Type': 'application/json'},
            );
      },
    );
    test("Test articles by category and/or country", () async {
      setUpMockHttpClientSuccess200();
      ArticlesModel response = await articleRemoteDataSourceImplentation
          .getArticle("technology", "us");

      verify(() => mockHttpClient
          .get(Uri.parse(url), headers: {'Content-rType': 'application/json'}));

      expect(response, equals(articlesModels));
    });

    test("Error in remote datasource ", () {
      setUpMockHttpClientFailure404();
      final call = articleRemoteDataSourceImplentation.getArticle;
      expect(call("technology", "us"),
          throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
