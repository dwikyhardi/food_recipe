part of 'recipe_list_bloc.dart';

abstract class RecipeListState extends Equatable {
  const RecipeListState();
}

class RecipeListEmpty extends RecipeListState {
  @override
  List<Object> get props => [];
}


class RecipeListLoading extends RecipeListState {
  @override
  List<Object> get props => [];
}

class RecipeListLoaded extends RecipeListState {
  final List<RecipeList> recipeList;

  const RecipeListLoaded({required this.recipeList});

  @override
  List<Object> get props => [recipeList];
}

class RecipeListError extends RecipeListState {

  final String errorMessage;

  const RecipeListError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}