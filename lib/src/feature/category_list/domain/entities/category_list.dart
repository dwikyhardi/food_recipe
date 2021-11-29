import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CategoryList extends Equatable {
  final List<Category> category;

  const CategoryList({required this.category}) : super();

  @override
  List<Object> get props => [category];
}

class Category extends Equatable {
  final String strCategory;

  const Category({required this.strCategory}) : super();

  @override
  List<Object> get props => [strCategory];
}
