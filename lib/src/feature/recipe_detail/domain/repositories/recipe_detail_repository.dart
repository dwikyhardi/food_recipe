import 'package:dartz/dartz.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/feature/recipe_detail/domain/entity/recipe_detail.dart';

abstract class RecipeDetailRepository{

  Future<Either<Failure, RecipeDetail>> getRecipeDetail({required String idMeal});

}