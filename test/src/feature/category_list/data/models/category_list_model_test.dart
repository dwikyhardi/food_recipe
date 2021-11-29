import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe/src/feature/category_list/data/models/category_list_models.dart';
import 'package:food_recipe/src/feature/category_list/domain/entities/category_list.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  final tCategoryListModel = CategoryListModels(
      categories: List.generate(
          1, (index) => CategoryModels(strCategory: 'Test $index')));

  test('should be a subclass of CategoryList entities', () async {
    //arrange
    expect(tCategoryListModel, isA<CategoryList>());
  });

  group('fromJson', () {
    test('should return a valid model from json', () async {
      //arrange

      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('category_list_response.json'));

      //act

      final result = CategoryListModels.fromJson(jsonMap);

      //assert

      expect(result, tCategoryListModel);
    });
  });

  group('toJosn', () {
    test('should return a Json containing proper data', () async {
      //act
      final result = tCategoryListModel.toJson();

      //assert
      final expectedResult = {
        "meals": [
          {"strCategory": "Test 0"}
        ]
      };
      expect(result, expectedResult);
    });
  });
}
