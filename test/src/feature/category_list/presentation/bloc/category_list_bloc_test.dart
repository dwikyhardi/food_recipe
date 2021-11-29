import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe/src/core/error/failure.dart';
import 'package:food_recipe/src/core/usecase/usecase.dart';
import 'package:food_recipe/src/feature/category_list/domain/entities/category_list.dart';
import 'package:food_recipe/src/feature/category_list/domain/usecases/get_category_list.dart';
import 'package:food_recipe/src/feature/category_list/presentation/bloc/category_list_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'category_list_bloc_test.mocks.dart';

@GenerateMocks([GetCategoryList])
void main() {
  late MockGetCategoryList mockGetCategoryList;
  late CategoryListBloc bloc;

  setUp(() {
    mockGetCategoryList = MockGetCategoryList();
    bloc = CategoryListBloc(getCategoryList: mockGetCategoryList);
  });

  test('initial state should CategoryListEmpty', () async {
    expect(bloc.state, equals(CategoryListEmpty()));
  });

  group('GetCategoryList', () {
    final CategoryList tCategoryList = CategoryList(
        category:
            List.generate(5, (index) => Category(strCategory: 'Test $index')));

    test('should verify GetCategoryListEvent called and return CategoryListEmpty State', () async {
      //arrange
      when(bloc.getCategoryList(NoParams()))
          .thenAnswer((_) async => Right(tCategoryList));

      //act
      bloc.add(const GetCategoryListEvent());
      await untilCalled(mockGetCategoryList(NoParams()));

      //assert
      verify(mockGetCategoryList(NoParams()));
      // expectLater(bloc.state, equals(CategoryListEmpty()));
    });

    test('should call CategoryListEmpty and return CategoryList entity', () async {
      //arrange
      when(mockGetCategoryList(NoParams()))
          .thenAnswer((_) async => Right(tCategoryList));

      //assert
      var expected = [
        CategoryListEmpty(),
        CategoryListLoading(),
        CategoryListLoaded(categoryList: tCategoryList),
      ];
      expectLater(bloc.state, equals(CategoryListEmpty()));
      expectLater(bloc.stream, emitsInOrder(expected));

      //act
      bloc.add(const GetCategoryListEvent());
    });

    test('should call CategoryListEmpty and return DatabaseFailure', () async {
      //arrange
      when(mockGetCategoryList(NoParams()))
          .thenAnswer((_) async => Left(DatabaseFailure()));

      //assert
      var expected = [
        CategoryListEmpty(),
        CategoryListLoading(),
        const CategoryListError(errorMessage: DATABASE_FAILURE_MESSAGE),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));

      //act
      bloc.add(const GetCategoryListEvent());
    });

    test('should call CategoryListEmpty and return ServerFailure', () async {
      //arrange
      when(mockGetCategoryList(NoParams()))
          .thenAnswer((_) async => Left(ServerFailure()));

      //assert
      var expected = [
        CategoryListEmpty(),
        CategoryListLoading(),
        const CategoryListError(errorMessage: SERVER_FAILURE_MESSAGE),
      ];

      expectLater(bloc.stream, emitsInOrder(expected));

      //act
      bloc.add(const GetCategoryListEvent());
    });
    
  });
}
