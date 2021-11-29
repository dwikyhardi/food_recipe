part of 'recipe_detail_bloc.dart';

abstract class RecipeDetailState extends Equatable {
  const RecipeDetailState();
}

class RecipeDetailEmpty extends RecipeDetailState {
  @override
  List<Object> get props => [];
}

class RecipeDetailLoading extends RecipeDetailState {
  @override
  List<Object> get props => [];
}

class RecipeDetailLoaded extends RecipeDetailState {
  final RecipeDetail recipeDetail;

  const RecipeDetailLoaded({required this.recipeDetail});

  @override
  List<Object> get props => [recipeDetail];
}

class RecipeDetailError extends RecipeDetailState {
  final String errorMessage;

  const RecipeDetailError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
