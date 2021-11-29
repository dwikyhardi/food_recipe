import 'package:dartz/dartz.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/core/usecase/usecase.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/entities/recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/repositories/recipe_list_repository.dart';

class StreamFavouriteRecipeList implements StreamUseCase<List<RecipeList>, NoParams> {
  final RecipeListRepository repository;

  StreamFavouriteRecipeList(this.repository);

  @override
  Stream<Either<Failure, List<RecipeList>>> call(NoParams params) {
      return repository.streamFavouriteRecipeList();
  }
}