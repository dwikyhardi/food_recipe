import 'package:food_recipe/src/feature/recipe_list/domain/entities/recipe_list.dart';

class RecipeListModels extends RecipeList {
  const RecipeListModels({
    required String strMeal,
    required String strThumb,
    required String idMeal,
    required bool isFav,
  }) : super(
          idMeal: idMeal,
          strMeal: strMeal,
          strThumb: strThumb,
          isFav: isFav,
        );

  factory RecipeListModels.fromJson(Map<String, dynamic> json) {
    return RecipeListModels(
      strMeal: json['strMeal'] ?? '',
      strThumb: json['strMealThumb'] ?? '',
      idMeal: json['idMeal'] ?? '',
      isFav: json['isFav'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strMeal': strMeal,
      'strMealThumb': strThumb,
      'idMeal': idMeal,
      'isFav': isFav,
    };
  }
}
