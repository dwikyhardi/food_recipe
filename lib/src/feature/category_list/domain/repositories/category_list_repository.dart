import 'package:dartz/dartz.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/feature/category_list/domain/entities/category_list.dart';

abstract class CategoryListRepository{

  Future<Either<Failure, CategoryList>> getCategoryList();

}