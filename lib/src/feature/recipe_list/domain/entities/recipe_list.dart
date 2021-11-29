import 'package:equatable/equatable.dart';

class RecipeList extends Equatable {
  final String strMeal;
  final String strThumb;
  final String idMeal;
  final bool isFav;

  const RecipeList({
    required this.strMeal,
    required this.strThumb,
    required this.idMeal,
    required this.isFav
  });

  @override
  List<Object> get props => [strMeal, strThumb, idMeal, isFav];
}
