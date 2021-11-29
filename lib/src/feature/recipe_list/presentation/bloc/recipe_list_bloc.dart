import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/core/usecase/usecase.dart';
import 'package:food_recipe/src/feature/category_list/presentation/bloc/category_list_bloc.dart';
import 'package:food_recipe/src/feature/recipe_detail/domain/usecases/get_recipe_detail.dart'
    as paramId;
import 'package:food_recipe/src/feature/recipe_detail/presentation/pages/recipe_detail_pages.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/entities/recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/usecases/get_favourite_recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/usecases/get_recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/usecases/remove_favourite_recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/usecases/save_favourite_recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/usecases/stream_favourite_recipe_list.dart';

part 'recipe_list_event.dart';

part 'recipe_list_state.dart';

class RecipeListBloc extends Bloc<RecipeListEvent, RecipeListState> {
  final GetRecipeList getRecipeList;
  final GetFavouriteRecipeList getFavouriteRecipeList;
  final SaveFavouriteRecipeList saveFavouriteRecipeList;
  final RemoveFavouriteRecipeList removeFavouriteRecipeList;
  final StreamFavouriteRecipeList streamFavouriteRecipeList;

  RecipeListBloc({
    required this.getRecipeList,
    required this.saveFavouriteRecipeList,
    required this.getFavouriteRecipeList,
    required this.removeFavouriteRecipeList,
    required this.streamFavouriteRecipeList,
  }) : super(RecipeListEmpty()) {
    on<GetRecipeListEvent>(
        (event, emit) async => onGetRecipeListEvent(event, emit));

    on<OpenRecipeDetailEvent>(
        (event, emit) async => onOpenRecipeDetailEvent(event, emit));

    on<SetFavouriteRecipeListEvent>(
        (event, emit) async => onSetFavouriteRecipeListEvent(event, emit));
  }

  Stream<List<String>> streamFavRecipeId() async* {
    StreamTransformer<Either<Failure, List<String>>, List<String>> transformer =
        StreamTransformer.fromHandlers(handleData:
            (Either<Failure, List<String>> data,
                EventSink<List<String>> output) {
      if (data.isRight()) {
        output.add(data.getOrElse(() => []));
      }
    });
    yield* getFavouriteRecipeList(NoParams()).transform(transformer);
  }

  Stream<List<RecipeList>> streamFavRecipe() async* {
    StreamTransformer<Either<Failure, List<RecipeList>>, List<RecipeList>> transformer =
    StreamTransformer.fromHandlers(handleData:
        (Either<Failure, List<RecipeList>> data,
        EventSink<List<RecipeList>> output) {
      if (data.isRight()) {
        output.add(data.getOrElse(() => []));
      }
    });
    yield* streamFavouriteRecipeList(NoParams()).transform(transformer);
  }

  Future<void> onSetFavouriteRecipeListEvent(SetFavouriteRecipeListEvent event,
      Emitter<RecipeListState> emitter) async {
    if (event.isFav) {
      await removeFavouriteRecipeList(paramId.Params(idMeal: event.idMeal));
    } else {
      await saveFavouriteRecipeList(paramId.Params(idMeal: event.idMeal));
    }
  }

  Future<void> onOpenRecipeDetailEvent(
      OpenRecipeDetailEvent event, Emitter<RecipeListState> emitter) async {
    Navigator.pushNamed(event.buildContext, RecipeDetailPages.routeName,
        arguments: {
          'idMeal': event.idMeal,
        });
  }

  Future<void> onGetRecipeListEvent(
      GetRecipeListEvent event, Emitter<RecipeListState> emitter) async {
    emitter(RecipeListEmpty());
    emitter(RecipeListLoading());

    await getRecipeList(Params(categoryName: event.categoryName, isFav: event.isFav))
        .then((failureOrRecipeList) {
      emitter(_eitherLoadedOrErrorState(failureOrRecipeList));
    });
  }

  RecipeListState _eitherLoadedOrErrorState(
    Either<Failure, List<RecipeList>> failureOrRecipeList,
  ) {

    return failureOrRecipeList.fold(
      (failure) => RecipeListError(errorMessage: _mapFailureToMessage(failure)),
      (recipeList) {
        return RecipeListLoaded(recipeList: recipeList);
      },
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
