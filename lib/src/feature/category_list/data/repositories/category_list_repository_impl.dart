import 'package:dartz/dartz.dart';
import 'package:food_recipe/src/core/error/exceptions.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/core/network/network_info.dart';
import 'package:food_recipe/src/feature/category_list/data/datasource/category_list_local_datasource.dart';
import 'package:food_recipe/src/feature/category_list/data/datasource/category_list_remote_datasource.dart';
import 'package:food_recipe/src/feature/category_list/domain/entities/category_list.dart';
import 'package:food_recipe/src/feature/category_list/domain/repositories/category_list_repository.dart';

class CategoryListRepositoryImpl implements CategoryListRepository {
  final CategoryListRemoteDatasource remoteDataSource;
  final CategoryListLocalDatasource localDataSource;
  final NetworkInfo networkInfo;

  CategoryListRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, CategoryList>> getCategoryList() async {
    if (await networkInfo.isConnected) {
      try {
        return getCategoryListRemote();
      } on ServerException {
        return getCategoryListLocal();
      }
    } else {
      try {
        return getCategoryListLocal();
      } on DatabaseException {
        return Left(DatabaseFailure());
      }
    }
  }

  Future<Either<Failure, CategoryList>> getCategoryListRemote() async {
    try {
      return await remoteDataSource.getCategoryList().then((categoryList) {
        localDataSource.saveCategoryList(categoryList);
        return Right(categoryList);
      });
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, CategoryList>> getCategoryListLocal() async {
    try {
      final categoryList = await localDataSource.getCategoryList();
      return Right(categoryList);
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }
}
