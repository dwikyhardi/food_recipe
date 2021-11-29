import 'package:dartz/dartz.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/core/usecase/usecase.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/entities/recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/repositories/recipe_list_repository.dart';

class GetRecipeList implements UseCase<List<RecipeList>, Params> {
  final RecipeListRepository repository;

  GetRecipeList(this.repository);

  @override
  Future<Either<Failure, List<RecipeList>>> call(Params params) {
    if(params.isFav){
      return repository.getFavouriteRecipeList();
    }else{
      return repository.getRecipeList(categoryName: params.categoryName);
    }
  }
}

class Params {
  final String categoryName;
  final bool isFav;

  Params({required this.categoryName, required this.isFav});
}
