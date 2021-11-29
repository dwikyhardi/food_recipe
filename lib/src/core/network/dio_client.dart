
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'dio_client.g.dart';

@RestApi(baseUrl: '')
abstract class DioClient {
  factory DioClient(Dio dio, {String baseUrl}) = _DioClient;

  @GET('list.php')
  Future<Map<String, dynamic>> getAllCategory({@Query('c') String category = 'list'});

  @GET('list.php')
  Future<Map<String, dynamic>> getAllIngredient({@Query('i') String category = 'list'});

  @GET('list.php')
  Future<Map<String, dynamic>> getAllArea({@Query('a') String category = 'list'});

  @GET('search.php')
  Future<Map<String, dynamic>> searchByName({@Query('s') String mealName = ''});

  @GET('lookup.php')
  Future<Map<String, dynamic>> detailMeal({@Query('i') String idMeal = ''});

  @GET('filter.php')
  Future<Map<String, dynamic>> filterByCategory({@Query('c') String category = ''});

  @GET('filter.php')
  Future<Map<String, dynamic>> filterByArea({@Query('a') String area = ''});

}