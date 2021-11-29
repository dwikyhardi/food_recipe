import 'package:dartz/dartz.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/core/usecase/usecase.dart';
import 'package:food_recipe/src/feature/recipe_detail/domain/entity/recipe_detail.dart';
import 'package:food_recipe/src/feature/recipe_detail/domain/repositories/recipe_detail_repository.dart';

class GetRecipeDetail extends UseCase<RecipeDetail, Params> {
  final RecipeDetailRepository repository;

  GetRecipeDetail(this.repository);

  @override
  Future<Either<Failure, RecipeDetail>> call(Params params) {
    return repository.getRecipeDetail(idMeal: params.idMeal);
  }
}

class Params {
  final String idMeal;

  Params({required this.idMeal});
}
