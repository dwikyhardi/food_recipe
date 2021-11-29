import 'package:dartz/dartz.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/core/usecase/usecase.dart';
import 'package:food_recipe/src/feature/recipe_detail/domain/usecases/get_recipe_detail.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/repositories/recipe_list_repository.dart';

class SaveFavouriteRecipeList extends UseCase<bool, Params> {
  final RecipeListRepository repository;

  SaveFavouriteRecipeList(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.saveFavouriteRecipeList(idMeal: params.idMeal);
  }
}
