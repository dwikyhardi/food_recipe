import 'package:dartz/dartz.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/entities/recipe_list.dart';

abstract class RecipeListRepository{

  Future<Either<Failure, List<RecipeList>>> getRecipeList({required String categoryName});
  Future<Either<Failure, List<RecipeList>>> getFavouriteRecipeList();
  Stream<Either<Failure, List<RecipeList>>> streamFavouriteRecipeList();
  Stream<Either<Failure, List<String>>> streamFavouriteRecipeListId();
  Future<Either<Failure, bool>> saveFavouriteRecipeList({required String idMeal});
  Future<Either<Failure, bool>> removeFavouriteRecipeList({required String idMeal});

}