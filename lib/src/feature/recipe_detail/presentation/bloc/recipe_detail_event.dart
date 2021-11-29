part of 'recipe_detail_bloc.dart';

abstract class RecipeDetailEvent extends Equatable {
  const RecipeDetailEvent();
}

class GetRecipeDetailEvent extends RecipeDetailEvent {
  final String idMeal;

  const GetRecipeDetailEvent(this.idMeal);

  @override
  List<Object> get props => [idMeal];
}
