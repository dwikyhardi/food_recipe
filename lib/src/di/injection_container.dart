import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:food_recipe/src/core/network/dio_client.dart';
import 'package:food_recipe/src/core/network/dio_service.dart';
import 'package:food_recipe/src/core/network/launch_another_apps.dart';
import 'package:food_recipe/src/core/network/network_info.dart';
import 'package:food_recipe/src/feature/category_list/data/datasource/category_list_local_datasource.dart';
import 'package:food_recipe/src/feature/category_list/data/datasource/category_list_remote_datasource.dart';
import 'package:food_recipe/src/feature/category_list/data/repositories/category_list_repository_impl.dart';
import 'package:food_recipe/src/feature/category_list/data/table/category_list_table.dart';
import 'package:food_recipe/src/feature/category_list/domain/repositories/category_list_repository.dart';
import 'package:food_recipe/src/feature/category_list/domain/usecases/get_category_list.dart';
import 'package:food_recipe/src/feature/category_list/presentation/bloc/category_list_bloc.dart';
import 'package:food_recipe/src/feature/recipe_detail/data/datasource/recipe_detail_remote_datasource.dart';
import 'package:food_recipe/src/feature/recipe_detail/data/repositories/recipe_detail_repository_impl.dart';
import 'package:food_recipe/src/feature/recipe_detail/domain/repositories/recipe_detail_repository.dart';
import 'package:food_recipe/src/feature/recipe_detail/domain/usecases/get_recipe_detail.dart';
import 'package:food_recipe/src/feature/recipe_detail/presentation/bloc/recipe_detail_bloc.dart';
import 'package:food_recipe/src/feature/recipe_list/data/datasource/recipe_local_data_source.dart';
import 'package:food_recipe/src/feature/recipe_list/data/datasource/recipe_remote_data_source.dart';
import 'package:food_recipe/src/feature/recipe_list/data/repositories/recipe_list_repository_impl.dart';
import 'package:food_recipe/src/feature/recipe_list/data/table/recipe_list_table.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/repositories/recipe_list_repository.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/usecases/get_favourite_recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/usecases/get_recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/usecases/remove_favourite_recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/usecases/save_favourite_recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/usecases/stream_favourite_recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/presentation/bloc/recipe_list_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Feature CategoryList Dependencies
  //BloC
  sl.registerFactory(() => CategoryListBloc(getCategoryList: sl()));

  //UseCase
  sl.registerLazySingleton(() => GetCategoryList(sl()));

  //Repository
  sl.registerLazySingleton<CategoryListRepository>(
      () => CategoryListRepositoryImpl(
            remoteDataSource: sl(),
            localDataSource: sl(),
            networkInfo: sl(),
          ));

  //DataSource
  sl.registerLazySingleton<CategoryListRemoteDatasource>(
      () => CategoryListRemoteDatasourceImpl(client: sl()));
  sl.registerLazySingleton<CategoryListLocalDatasource>(
      () => CategoryListLocalDatasourceImpl(categoryListDatabase: sl()));
  sl.registerLazySingleton(() => CategoryListDatabase());

  ///Feature RecipeList Dependencies
  //Bloc
  sl.registerFactory(() => RecipeListBloc(
        getRecipeList: sl(),
        saveFavouriteRecipeList: sl(),
        getFavouriteRecipeList: sl(),
        removeFavouriteRecipeList: sl(),
    streamFavouriteRecipeList: sl(),
      ));

  //UseCase
  sl.registerLazySingleton(() => GetRecipeList(sl()));
  sl.registerLazySingleton(() => GetFavouriteRecipeList(sl()));
  sl.registerLazySingleton(() => SaveFavouriteRecipeList(sl()));
  sl.registerLazySingleton(() => RemoveFavouriteRecipeList(sl()));
  sl.registerLazySingleton(() => StreamFavouriteRecipeList(sl()));

  //Repository
  sl.registerLazySingleton<RecipeListRepository>(() => RecipeListRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));

  //DataSource
  sl.registerLazySingleton<RecipeRemoteDataSource>(
      () => RecipeRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<RecipeLocalDataSource>(
      () => RecipeLocalDataSourceImpl(recipeListDatabase: sl()));
  sl.registerLazySingleton(() => RecipeListDatabase());

  ///Feature RecipeDetail Dependencies
  //Bloc
  sl.registerFactory(() => RecipeDetailBloc(getRecipeDetail: sl()));

  //UseCase
  sl.registerLazySingleton(() => GetRecipeDetail(sl()));

  //Repository
  sl.registerLazySingleton<RecipeDetailRepository>(
      () => RecipeDetailRepositoryImpl(
            remoteDatasource: sl(),
            networkInfo: sl(),
          ));

  //DataSource
  sl.registerLazySingleton<RecipeDetailRemoteDatasource>(
      () => RecipeDetailRemoteDatasourceImpl(client: sl()));

  ///Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///External
  final Dio dio = await DioService.setupDio();
  sl.registerLazySingleton<Dio>(() => dio);
  sl.registerLazySingleton(() => DioClient(sl()));
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => LaunchAnotherApp());
}
