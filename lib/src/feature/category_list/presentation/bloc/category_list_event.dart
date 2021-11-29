part of 'category_list_bloc.dart';

abstract class CategoryListEvent extends Equatable {
  const CategoryListEvent();
}

class GetCategoryListEvent extends CategoryListEvent {
  @override
  List<Object> get props => [];

  const GetCategoryListEvent();
}

class OpenRecipeListEvent extends CategoryListEvent {
  final String categoryName;
  final BuildContext buildContext;

  @override
  List<Object> get props => [categoryName, buildContext];

  const OpenRecipeListEvent(
      {required this.categoryName, required this.buildContext});
}

class OpenFavouriteRecipeListEvent extends CategoryListEvent {
  final BuildContext buildContext;

  @override
  List<Object> get props => [buildContext];

  const OpenFavouriteRecipeListEvent(
      {required this.buildContext});
}
