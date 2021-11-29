part of 'category_list_bloc.dart';

abstract class CategoryListState extends Equatable {
  const CategoryListState();
}

class CategoryListEmpty extends CategoryListState {
  @override
  List<Object> get props => [];
}

class CategoryListLoading extends CategoryListState {
  @override
  List<Object> get props => [];
}

class CategoryListLoaded extends CategoryListState {

  final CategoryList categoryList;

  const CategoryListLoaded({required this.categoryList});

  @override
  List<Object> get props => [categoryList];
}

class CategoryListError extends CategoryListState {

  final String errorMessage;

  const CategoryListError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}