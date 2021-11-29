import 'package:food_recipe/src/core/error/exceptions.dart';
import 'package:food_recipe/src/core/network/dio_client.dart';
import 'package:food_recipe/src/feature/recipe_detail/data/models/recipe_detail_models.dart';

abstract class RecipeDetailRemoteDatasource {
  Future<RecipeDetailModels> getRecipeDetail({required String idMeal});
}

class RecipeDetailRemoteDatasourceImpl extends RecipeDetailRemoteDatasource {
  final DioClient client;

  RecipeDetailRemoteDatasourceImpl({required this.client});

  @override
  Future<RecipeDetailModels> getRecipeDetail({required String idMeal}) async {
    try {
      var response = await client.detailMeal(idMeal: idMeal);
      if (response['meals'] != null && response['meals'].isNotEmpty) {
        return RecipeDetailModels.fromJson(response['meals'][0]);
      } else {
        throw ServerException();
      }
    } on Exception {
      throw ServerException();
    }
  }
}
