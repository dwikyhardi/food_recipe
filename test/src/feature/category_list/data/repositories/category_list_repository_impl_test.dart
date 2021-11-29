import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe/src/core/error/exceptions.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/core/network/network_info.dart';
import 'package:food_recipe/src/feature/category_list/data/datasource/category_list_local_datasource.dart';
import 'package:food_recipe/src/feature/category_list/data/datasource/category_list_remote_datasource.dart';
import 'package:food_recipe/src/feature/category_list/data/models/category_list_models.dart';
import 'package:food_recipe/src/feature/category_list/data/repositories/category_list_repository_impl.dart';
import 'package:food_recipe/src/feature/category_list/domain/entities/category_list.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'category_list_repository_impl_test.mocks.dart';

// class MockRemoteDataSource extends Mock
//     implements CategoryListRemoteDatasource {}
//
// class MockLocalDataSource extends Mock implements CategoryListLocalDatasource {}
//
// class MockNetworkInfo extends Mock implements NetworkInfo {}

@GenerateMocks([CategoryListRemoteDatasource, CategoryListLocalDatasource, NetworkInfo],customMocks: [
  MockSpec<CategoryListRemoteDatasource>(as: #MockRemoteDataSource),
  MockSpec<CategoryListLocalDatasource>(as: #MockLocalDataSource),
])
void main() {
  late CategoryListRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = CategoryListRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected)
            .thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getCategoryList', () {
    final tCategoryListModel = CategoryListModels(
        categories: List.generate(
            1, (index) => CategoryModels(strCategory: 'Test $index')));

    final CategoryList tCategoryList = tCategoryListModel;

    // test('should check if the device is online', () async {
    //   //arrange
    //   when(mockNetworkInfo.isConnected)
    //       .thenAnswer((_) async => true);
    //
    //   //act
    //
    //   await repository.getCategoryList();
    //
    //   //assert
    //
    //   verify(mockNetworkInfo.isConnected);
    // });

    runTestOnline(() {
      test(
          'should call remote data when the call to remote data source is success',
          () async {
        //arrange
        when(mockRemoteDataSource.getCategoryList())
            .thenAnswer((_) async => tCategoryListModel);
        //act

        final result = await repository.getCategoryList();

        //assert

        verify(mockRemoteDataSource.getCategoryList());
        expect(result, equals(Right(tCategoryListModel)));
      });

      test('should save data when the call to remote data source is success',
          () async {
        //arrange
        when(mockRemoteDataSource.getCategoryList())
            .thenAnswer((_) async => tCategoryListModel);
        //act

        final result = await repository.getCategoryList();

        //assert

        verify(mockRemoteDataSource.getCategoryList());
        verify(mockLocalDataSource.saveCategoryList(tCategoryListModel));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        //arrange
        when(mockRemoteDataSource.getCategoryList())
            .thenThrow(ServerException());
        //act

        final result = await repository.getCategoryList();

        //assert

        verify(mockRemoteDataSource.getCategoryList());
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestOffline(() {
      test('should return local data when the local data is present', () async {
        //arrange
        when(mockLocalDataSource.getCategoryList())
            .thenAnswer((_) async => tCategoryListModel);

        //act

        final result = await repository.getCategoryList();

        //assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getCategoryList());
        expect(result, equals(Right(tCategoryListModel)));
      });

      test('should return DatabaseFailure when the local data is not present',
          () async {
        //arrange
        when(mockLocalDataSource.getCategoryList())
            .thenThrow(DatabaseException());

        //act

        final result = await repository.getCategoryList();

        //assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getCategoryList());
        expect(result, equals(Left(DatabaseFailure())));
      });
    });
  });
}
