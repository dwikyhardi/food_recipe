import 'dart:convert';

import 'package:food_recipe/src/feature/category_list/domain/entities/category_list.dart';

class CategoryListModels extends CategoryList {
  final List<CategoryModels> categories;
  const CategoryListModels({required this.categories})
      : super(category: categories);

  factory CategoryListModels.fromJson(Map<String, dynamic> json) {
    List<CategoryModels> category = [];

    if (json['meals'] != null && json['meals'].isNotEmpty) {
      for (var cat in json['meals']) {
        category.add(CategoryModels.fromJson(cat));
      }
    }

    return CategoryListModels(categories: category);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    if(categories.isNotEmpty){
      data['meals'] = categories.map((e) => e.toJson()).toList();
    }

    return data;
  }
}

class CategoryModels extends Category {
  const CategoryModels({required String strCategory})
      : super(strCategory: strCategory);

  factory CategoryModels.fromJson(Map<String, dynamic> json) {
    return CategoryModels(strCategory: json['strCategory']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['strCategory'] = strCategory;

    return data;
  }
}
