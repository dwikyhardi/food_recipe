import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/core/usecase/usecase.dart';
import 'package:food_recipe/src/feature/category_list/domain/entities/category_list.dart';
import 'package:food_recipe/src/feature/category_list/domain/usecases/get_category_list.dart';
import 'package:food_recipe/src/feature/recipe_list/presentation/bloc/recipe_list_bloc.dart';
import 'package:food_recipe/src/feature/recipe_list/presentation/pages/favourite_recipe_list_pages.dart';
import 'package:food_recipe/src/feature/recipe_list/presentation/pages/recipe_list_pages.dart';

part 'category_list_event.dart';

part 'category_list_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String DATABASE_FAILURE_MESSAGE = 'Database Failure';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  final GetCategoryList getCategoryList;

  CategoryListBloc({required this.getCategoryList})
      : super(CategoryListEmpty()) {
    on<GetCategoryListEvent>(
        (event, emit) async => onGetCategoryListEvent(event, emit));
    on<OpenRecipeListEvent>(
        (event, emit) async => onOpenRecipeListEvent(event, emit));
    on<OpenFavouriteRecipeListEvent>(
        (event, emit) async => onOpenFavouriteRecipeListEvent(event, emit));
  }

  Future<void> onOpenFavouriteRecipeListEvent(
      OpenFavouriteRecipeListEvent event, Emitter<CategoryListState> emitter) async {
    Navigator.pushNamed(event.buildContext, FavouriteRecipeListPages.routeName);
  }
  Future<void> onOpenRecipeListEvent(
      OpenRecipeListEvent event, Emitter<CategoryListState> emitter) async {
    Navigator.pushNamed(event.buildContext, RecipeListPages.routeName,
        arguments: {'categoryName': event.categoryName});
  }

  void onGetCategoryListEvent(
      GetCategoryListEvent event, Emitter<CategoryListState> emitter) async {
    emitter(CategoryListEmpty());
    emitter(CategoryListLoading());
    await getCategoryList(NoParams()).then((failureOrCategoryList) {
      emitter(_eitherLoadedOrErrorState(failureOrCategoryList));
    });
  }

  CategoryListState _eitherLoadedOrErrorState(
    Either<Failure, CategoryList> failureOrCategoryList,
  ) {
    return failureOrCategoryList.fold(
      (failure) =>
          CategoryListError(errorMessage: _mapFailureToMessage(failure)),
      (categoryList) => CategoryListLoaded(categoryList: categoryList),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case DatabaseFailure:
        return DATABASE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
