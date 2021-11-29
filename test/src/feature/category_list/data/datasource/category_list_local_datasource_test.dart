import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe/src/feature/category_list/data/datasource/category_list_local_datasource.dart';
import 'package:food_recipe/src/feature/category_list/data/models/category_list_models.dart';
import 'package:food_recipe/src/feature/category_list/data/table/category_list_table.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'category_list_local_datasource_test.mocks.dart';

@GenerateMocks([
  CategoryListDatabase,
  CategoryListDao,
])
void main() {
  late CategoryListLocalDatasourceImpl categoryListLocalDatasourceImpl;
  late MockCategoryListDatabase mockCategoryListDatabase;

  setUp(() {
    mockCategoryListDatabase = MockCategoryListDatabase();
    categoryListLocalDatasourceImpl = CategoryListLocalDatasourceImpl(
        categoryListDatabase: mockCategoryListDatabase);
    print(mockCategoryListDatabase.schemaVersion);
  });

  final CategoryListModels tCategoryList = CategoryListModels(
      categories: List.generate(
          5, (index) => CategoryModels(strCategory: 'Test $index')));

  print(tCategoryList.toJson());

  group('Database Connection Test', () {
    test('should ', () async {
      //arrange
      when(categoryListLocalDatasourceImpl.getCategoryList())
          .thenAnswer((_) async => tCategoryList);

      //act
      final result =
          await mockCategoryListDatabase.categoryListDao.getCategoryList();

      //assert
      print(result.toJson());
      verify(categoryListLocalDatasourceImpl.getCategoryList());
      verify(mockCategoryListDatabase.categoryListDao.getCategoryList());
      expect(result.toJson(), equals(tCategoryList.toJson()));
    });
  });
}
