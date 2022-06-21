import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news/features/top_headlines/data/datasource/article_local_data_source.dart';
import 'package:news/features/top_headlines/data/datasource/article_local_data_source_implementation.dart';
import 'package:news/features/top_headlines/data/models/articles_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late ArticleLocalDataSourceImplementation
      articleLocalDataSourceImplementation;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    articleLocalDataSourceImplementation = ArticleLocalDataSourceImplementation(
        sharedPreferences: mockSharedPreferences);
  });
  group("", () {
    ArticlesModel articlesModel =
        ArticlesModel.fromJson(jsonDecode(fixture("news_cached.json")));
    test("", () async {
      when(() => mockSharedPreferences.getString(any()))
          .thenReturn(fixture("news_cached.json"));
      ArticlesModel response =
          await articleLocalDataSourceImplementation.getNewsCached();

      verify(() => mockSharedPreferences.getString("news_cached"));
      expect(response, articlesModel);
    });
  });
}
