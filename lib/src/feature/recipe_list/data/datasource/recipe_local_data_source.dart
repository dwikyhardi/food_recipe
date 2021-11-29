import 'package:food_recipe/src/core/error/exceptions.dart';
import 'package:food_recipe/src/feature/recipe_list/data/models/recipe_list_models.dart';
import 'package:food_recipe/src/feature/recipe_list/data/table/recipe_list_table.dart';

abstract class RecipeLocalDataSource {
  Future<List<RecipeListModels>> getRecipeList({required String category});

  Future<List<RecipeListModels>> getFavouriteRecipe();

  Stream<List<RecipeListModels>> streamFavouriteRecipe();

  Stream<List<String>> streamFavouriteRecipeId();

  Future<void> saveRecipeList(
      {required List<RecipeListModels> recipeList, required String category});

  Future<void> saveFavouriteRecipe({required String idMeal});

  Future<void> removeFavouriteRecipe({required String idMeal});
}

class RecipeLocalDataSourceImpl extends RecipeLocalDataSource {
  final RecipeListDatabase recipeListDatabase;

  RecipeLocalDataSourceImpl({required this.recipeListDatabase});

  @override
  Future<List<RecipeListModels>> getRecipeList(
      {required String category}) async {
    try {
      return await recipeListDatabase.recipeListDao
          .getRecipeList(category: category);
    } on Exception {
      throw DatabaseException();
    }
  }

  @override
  Future<void> saveRecipeList(
      {required List<RecipeListModels> recipeList,
      required String category}) async {
    for (var recipe in recipeList) {
      await recipeListDatabase.recipeListDao.saveRecipeList(
        RecipeListTableData(
          strMeal: recipe.strMeal,
          strMealThumb: recipe.strThumb,
          idMeal: recipe.idMeal,
          strCategory: category,
        ),
      );
    }
  }

  @override
  Future<void> removeFavouriteRecipe({required String idMeal}) async {
    try {
      return await recipeListDatabase.recipeListDao
          .removeFavouriteRecipe(idMeal);
    } on Exception {
      throw DatabaseException();
    }
  }

  @override
  Future<void> saveFavouriteRecipe({required String idMeal}) async {
    try {
      return await recipeListDatabase.recipeListDao
          .saveFavouriteRecipe(FavouriteRecipeListTableData(idMeal: idMeal));
    } on Exception {
      throw DatabaseException();
    }
  }

  @override
  Future<List<RecipeListModels>> getFavouriteRecipe() async {
    try {
      return await recipeListDatabase.recipeListDao.getFavouriteRecipeList();
    } on Exception {
      throw DatabaseException();
    }
  }


  @override
  Stream<List<RecipeListModels>> streamFavouriteRecipe() async*{
    yield* recipeListDatabase.recipeListDao.streamFavouriteRecipeList();
  }

  @override
  Stream<List<String>> streamFavouriteRecipeId() async*{
    yield* recipeListDatabase.recipeListDao.streamFavouriteRecipeListId();
    // try {
    //   yield* await recipeListDatabase.recipeListDao.streamFavouriteRecipeListId().then((value) {
    //     List<String> data = [];
    //     for(var element in value){
    //       data.add(element.idMeal);
    //     }
    //     return data;
    //   });
    // } on Exception {
    //   throw DatabaseException();
    // }
  }
}
