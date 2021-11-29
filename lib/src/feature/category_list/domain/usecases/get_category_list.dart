import 'package:dartz/dartz.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/core/usecase/usecase.dart';
import 'package:food_recipe/src/feature/category_list/domain/entities/category_list.dart';
import 'package:food_recipe/src/feature/category_list/domain/repositories/category_list_repository.dart';

class GetCategoryList implements UseCase<CategoryList, NoParams> {
  final CategoryListRepository repository;

  GetCategoryList(this.repository);

  @override
  Future<Either<Failure, CategoryList>> call(NoParams noParams) async{
    return await repository.getCategoryList();
  }
}