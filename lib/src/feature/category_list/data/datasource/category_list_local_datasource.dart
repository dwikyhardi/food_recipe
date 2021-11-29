import 'dart:convert';

import 'package:food_recipe/src/core/error/exceptions.dart';
import 'package:food_recipe/src/feature/category_list/data/models/category_list_models.dart';
import 'package:food_recipe/src/feature/category_list/data/table/category_list_table.dart';

abstract class CategoryListLocalDatasource {

  Future<CategoryListModels> getCategoryList();

  Future<void> saveCategoryList(CategoryListModels categoryListModels);
}

class CategoryListLocalDatasourceImpl implements CategoryListLocalDatasource {
  final CategoryListDatabase categoryListDatabase;

  CategoryListLocalDatasourceImpl({required this.categoryListDatabase});

  @override
  Future<CategoryListModels> getCategoryList() async {
    try {
      return await categoryListDatabase.categoryListDao.getCategories().then((value) {
        List<CategoryModels> data = [];
        for (var element in value) {
          data.add(CategoryModels.fromJson(element.toJson()));
        }
        return CategoryListModels(categories: data);
      });
    } on Exception {
      throw DatabaseException();
    }
  }

  @override
  Future<void> saveCategoryList(CategoryListModels categoryList) async {
    categoryListDatabase.categoryListDao.saveCategoryList(CategoryListTable(category: jsonEncode(categoryList)));
  }
}
