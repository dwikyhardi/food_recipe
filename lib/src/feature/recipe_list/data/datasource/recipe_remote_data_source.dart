import 'package:food_recipe/src/core/error/exceptions.dart';
import 'package:food_recipe/src/core/network/dio_client.dart';
import 'package:food_recipe/src/feature/recipe_list/data/models/recipe_list_models.dart';

abstract class RecipeRemoteDataSource {
  /// calls https://www.themealdb.com/api/json/v1/1/filter.php?c=<category> endpoint
  Future<List<RecipeListModels>> getRecipeList({String? category});
}

class RecipeRemoteDataSourceImpl extends RecipeRemoteDataSource {
  final DioClient client;

  RecipeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<RecipeListModels>> getRecipeList({String? category}) async {
    try {
      final List<RecipeListModels> recipeList = <RecipeListModels>[];
      final response = await client.filterByCategory(category: category ?? '');

      if (response['meals'] != null && response['meals'].isNotEmpty) {
        for (var element in (response['meals'] as List<dynamic>)) {
          recipeList.add(RecipeListModels.fromJson(element as Map<String, dynamic>));
        }
      } else {
        throw ServerException();
      }

      return recipeList;
    } on Exception {
      throw ServerException();
    }
  }
}
