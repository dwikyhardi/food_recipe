part of 'recipe_list_bloc.dart';

abstract class RecipeListEvent extends Equatable {
  const RecipeListEvent();
}

class GetRecipeListEvent extends RecipeListEvent {
  final String categoryName;
  final bool isFav;

  @override
  List<Object> get props => [categoryName, isFav];

  const GetRecipeListEvent({required this.categoryName, required this.isFav});
}

class OpenRecipeDetailEvent extends RecipeListEvent {
  final BuildContext buildContext;
  final String idMeal;
  final String mealName;

  @override
  List<Object> get props => [idMeal, mealName, buildContext];

  const OpenRecipeDetailEvent({
    required this.idMeal,
    required this.mealName,
    required this.buildContext,
  });
}

class SetFavouriteRecipeListEvent extends RecipeListEvent {
  final String idMeal;
  final bool isFav;

  @override
  List<Object> get props => [idMeal, isFav];

  const SetFavouriteRecipeListEvent(
      {required this.idMeal, required this.isFav});
}
