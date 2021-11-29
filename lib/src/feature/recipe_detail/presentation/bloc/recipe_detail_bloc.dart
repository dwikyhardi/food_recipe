import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/feature/category_list/presentation/bloc/category_list_bloc.dart';
import 'package:food_recipe/src/feature/recipe_detail/domain/entity/recipe_detail.dart';
import 'package:food_recipe/src/feature/recipe_detail/domain/usecases/get_recipe_detail.dart';

part 'recipe_detail_event.dart';

part 'recipe_detail_state.dart';

class RecipeDetailBloc extends Bloc<RecipeDetailEvent, RecipeDetailState> {
  final GetRecipeDetail getRecipeDetail;

  RecipeDetailBloc({required this.getRecipeDetail}) : super(RecipeDetailEmpty()) {
    on<GetRecipeDetailEvent>(
        (event, emit) async => _onGetRecipeDetailEvent(event, emit));
  }

  Future<void> _onGetRecipeDetailEvent(
      GetRecipeDetailEvent event, Emitter<RecipeDetailState> emitter) async {
    emitter(RecipeDetailLoading());
    await getRecipeDetail(Params(idMeal: event.idMeal))
        .then((failureOrRecipeDetail) {
      emitter(_eitherLoadedOrErrorState(failureOrRecipeDetail));
    });
  }

  RecipeDetailState _eitherLoadedOrErrorState(
    Either<Failure, RecipeDetail> failureOrRecipeDetail,
  ) {
    return failureOrRecipeDetail.fold(
      (failure) =>
          RecipeDetailError(errorMessage: _mapFailureToMessage(failure)),
      (recipeDetail) => RecipeDetailLoaded(recipeDetail: recipeDetail),
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
