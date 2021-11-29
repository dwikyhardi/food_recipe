// import 'package:food_recipe/src/core/error/exceptions.dart';
// import 'package:food_recipe/src/feature/favourite_recipe/data/models/favourite_recipe_models.dart';
// import 'package:food_recipe/src/feature/recipe_list/data/table/recipe_list_table.dart';
//
// abstract class FavouriteRecipeLocalDatasource {
//   Future<List<FavouriteRecipeModels>> getFavouriteRecipe();
//
//   Future<List<String>> getFavouriteRecipeId();
//
//   Future<void> saveFavouriteRecipe({required String idMeal});
//
//   Future<void> removeFavouriteRecipe({required String idMeal});
// }
//
// class FavouriteRecipeLocalDatasourceImpl
//     implements FavouriteRecipeLocalDatasource {
//   final RecipeListDatabase recipeListDatabase;
//
//   FavouriteRecipeLocalDatasourceImpl({required this.recipeListDatabase});
//
//   @override
//   Future<List<FavouriteRecipeModels>> getFavouriteRecipe() async {
//     try {
//       return await recipeListDatabase.recipeListDao
//           .getFavouriteRecipeList()
//           .then((value) {
//         List<FavouriteRecipeModels> data = [];
//         for (var element in value) {
//           data.add(FavouriteRecipeModels(
//               strMeal: element.strMeal,
//               strThumb: element.strThumb,
//               idMeal: element.idMeal,
//               isFav: true));
//         }
//         return data;
//       });
//     } on Exception {
//       throw DatabaseException();
//     }
//   }
//
//   @override
//   Future<void> saveFavouriteRecipe({required String idMeal}) async {
//     try {
//       return await recipeListDatabase.recipeListDao
//           .saveFavouriteRecipe(FavouriteRecipeListTableData(idMeal: idMeal));
//     } on Exception {
//       throw DatabaseException();
//     }
//   }
//
//   @override
//   Future<void> removeFavouriteRecipe({required String idMeal}) async {
//     try {
//       return await recipeListDatabase.recipeListDao
//           .removeFavouriteRecipe(idMeal);
//     } on Exception {
//       throw DatabaseException();
//     }
//   }
//
//   @override
//   Future<List<String>> getFavouriteRecipeId() async {
//     try {
//       return await recipeListDatabase.recipeListDao
//           .getFavouriteRecipeListId()
//           .then((value) {
//         List<String> data = [];
//         for (var element in value) {
//           data.add(element.idMeal);
//         }
//         return data;
//       });
//     } on Exception {
//       throw DatabaseException();
//     }
//   }
// }
