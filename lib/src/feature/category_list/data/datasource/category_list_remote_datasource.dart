import 'package:food_recipe/src/core/error/exceptions.dart';
import 'package:food_recipe/src/core/network/dio_client.dart';
import 'package:food_recipe/src/feature/category_list/data/models/category_list_models.dart';

abstract class CategoryListRemoteDatasource {
  /// calls https://www.themealdb.com/api/json/v1/1/list.php?c=list endpoint
  Future<CategoryListModels> getCategoryList();
}

class CategoryListRemoteDatasourceImpl implements CategoryListRemoteDatasource {
  final DioClient client;

  CategoryListRemoteDatasourceImpl({required this.client});

  @override
  Future<CategoryListModels> getCategoryList() async {
    try {
      var response = await client.getAllCategory();
      List<CategoryModels> categoryList = [];
      if (response['meals'] != null && response['meals'].isNotEmpty) {
        for (Map<String, dynamic> element in response['meals']) {
          categoryList.add(CategoryModels.fromJson(element));
        }
      }
      return CategoryListModels(categories: categoryList);
    } on Exception {
      throw ServerException();
    }
  }
}
