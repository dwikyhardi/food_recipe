// import 'package:dartz/dartz.dart';
// import 'package:food_recipe/src/core/error/failure.dart';
// import 'package:food_recipe/src/core/usecase/usecase.dart';
// import 'package:food_recipe/src/feature/favourite_recipe/domain/entities/favourite_recipe.dart';
// import 'package:food_recipe/src/feature/favourite_recipe/domain/repositories/favourite_recipe_repository.dart';
//
// class GetFavouriteRecipe extends UseCase<List<FavouriteRecipe>, NoParams> {
//   final FavouriteRecipeRepository repository;
//
//   GetFavouriteRecipe(this.repository);
//
//   @override
//   Future<Either<Failure, List<FavouriteRecipe>>> call(NoParams params) async{
//     return await repository.getFavouriteRecipe();
//   }
// }
