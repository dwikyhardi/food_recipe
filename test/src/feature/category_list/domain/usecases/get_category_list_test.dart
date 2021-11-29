import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe/src/core/usecase/usecase.dart';
import 'package:food_recipe/src/feature/category_list/domain/entities/category_list.dart';
import 'package:food_recipe/src/feature/category_list/domain/repositories/category_list_repository.dart';
import 'package:food_recipe/src/feature/category_list/domain/usecases/get_category_list.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_category_list_test.mocks.dart';

@GenerateMocks([CategoryListRepository])
void main() {
  late GetCategoryList usecase;
  late MockCategoryListRepository mockCategoryListRepository;

  setUp(() {
    mockCategoryListRepository = MockCategoryListRepository();
    usecase = GetCategoryList(mockCategoryListRepository);
  });

  final CategoryList tCategoryList = CategoryList(
      category:
          List.generate(5, (index) => Category(strCategory: 'Test $index')));

  test('should get category list from repository', () async {
    //arrange
    when(mockCategoryListRepository.getCategoryList())
        .thenAnswer((_) async => Right(tCategoryList));
    //act
    final result = await usecase(NoParams());
    //assert
    expect(result, Right(tCategoryList));
    verify(mockCategoryListRepository.getCategoryList());
    verifyNoMoreInteractions(mockCategoryListRepository);
  });
}
