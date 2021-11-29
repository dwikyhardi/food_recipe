// import 'package:food_recipe/src/feature/favourite_recipe/domain/entities/favourite_recipe.dart';
//
// class FavouriteRecipeModels extends FavouriteRecipe {
//   const FavouriteRecipeModels({
//     required String strMeal,
//     required String strThumb,
//     required String idMeal,
//     required bool isFav,
//   }) : super(
//             strThumb: strThumb,
//             strMeal: strMeal,
//             idMeal: idMeal,
//       isFav: isFav);
//
//   factory FavouriteRecipeModels.fromJson(Map<String, dynamic> json) {
//     return FavouriteRecipeModels(
//       strMeal: json['strMeal'] ?? '',
//       strThumb: json['strMealThumb'] ?? '',
//       idMeal: json['idMeal'] ?? '',
//       isFav: json['isFav'] ?? '',
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'strMeal': strMeal,
//       'strMealThumb': strThumb,
//       'idMeal': idMeal,
//       'isFav': isFav,
//     };
//   }
//
//
// }
