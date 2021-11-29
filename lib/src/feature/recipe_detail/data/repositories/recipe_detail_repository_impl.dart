import 'package:dartz/dartz.dart';
import 'package:food_recipe/src/core/error/exceptions.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/core/network/network_info.dart';
import 'package:food_recipe/src/feature/recipe_detail/data/datasource/recipe_detail_remote_datasource.dart';
import 'package:food_recipe/src/feature/recipe_detail/domain/entity/recipe_detail.dart';
import 'package:food_recipe/src/feature/recipe_detail/domain/repositories/recipe_detail_repository.dart';

class RecipeDetailRepositoryImpl extends RecipeDetailRepository {
  final RecipeDetailRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  RecipeDetailRepositoryImpl(
      {required this.remoteDatasource, required this.networkInfo});

  @override
  Future<Either<Failure, RecipeDetail>> getRecipeDetail(
      {required String idMeal}) async {
    try {
      return await remoteDatasource
          .getRecipeDetail(idMeal: idMeal)
          .then((recipeDetail) {
        return Right(recipeDetail);
      });
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
