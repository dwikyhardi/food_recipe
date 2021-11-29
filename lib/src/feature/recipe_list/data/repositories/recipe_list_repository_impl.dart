import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:food_recipe/src/core/error/exceptions.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/core/network/network_info.dart';
import 'package:food_recipe/src/feature/recipe_list/data/datasource/recipe_local_data_source.dart';
import 'package:food_recipe/src/feature/recipe_list/data/datasource/recipe_remote_data_source.dart';
import 'package:food_recipe/src/feature/recipe_list/data/models/recipe_list_models.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/entities/recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/repositories/recipe_list_repository.dart';

class RecipeListRepositoryImpl implements RecipeListRepository {
  final RecipeRemoteDataSource remoteDataSource;
  final RecipeLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RecipeListRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<RecipeList>>> getRecipeList(
      {required String categoryName}) async {
    if (await networkInfo.isConnected) {
      try {
        return await remoteDataSource
            .getRecipeList(category: categoryName)
            .then((recipeList) {
          localDataSource.saveRecipeList(
              recipeList: recipeList, category: categoryName);
          return Right(recipeList);
        });
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        return await localDataSource
            .getRecipeList(category: categoryName)
            .then((recipeList) {
          return Right(recipeList);
        });
      } on DatabaseException {
        return Left(DatabaseFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<RecipeList>>> getFavouriteRecipeList() async {
    try {
      return await localDataSource.getFavouriteRecipe().then((recipeList) {
        return Right(recipeList);
      });
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }


  @override
  Stream<Either<Failure, List<RecipeList>>> streamFavouriteRecipeList() async*{
    try {
      StreamTransformer<List<RecipeListModels>, Either<Failure, List<RecipeList>>>
      transformer = StreamTransformer.fromHandlers(handleData:
          (List<RecipeList> data,
          EventSink<Either<Failure, List<RecipeList>>> output) {
        if (data.isNotEmpty) {
          output.add(Right(data));
        } else {
          output.add(Left(DatabaseFailure()));
        }
      });

      yield* localDataSource.streamFavouriteRecipe().transform(transformer);
    } on DatabaseException {
      yield Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveFavouriteRecipeList(
      {required String idMeal}) async {
    try {
      return await localDataSource
          .saveFavouriteRecipe(idMeal: idMeal)
          .then((_) {
        return const Right(true);
      });
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Stream<Either<Failure, List<String>>> streamFavouriteRecipeListId() async* {
    try {
      StreamTransformer<List<String>, Either<Failure, List<String>>>
          transformer = StreamTransformer.fromHandlers(handleData:
              (List<String> data,
                  EventSink<Either<Failure, List<String>>> output) {
        if (data.isNotEmpty) {
          output.add(Right(data));
        } else {
          output.add(Left(DatabaseFailure()));
        }
      });

      yield* localDataSource.streamFavouriteRecipeId().transform(transformer);
    } on DatabaseException {
      yield Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> removeFavouriteRecipeList(
      {required String idMeal}) async{
    try {
      return await localDataSource
          .removeFavouriteRecipe(idMeal: idMeal)
          .then((_) {
        return const Right(true);
      });
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }
}
