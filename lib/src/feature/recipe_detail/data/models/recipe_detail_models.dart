import 'package:food_recipe/src/feature/recipe_detail/domain/entity/recipe_detail.dart';

class RecipeDetailModels extends RecipeDetail {
  const RecipeDetailModels({
    required String? idMeal,
    required String? strMeal,
    required String? strDrinkAlternate,
    required String? strCategory,
    required String? strArea,
    required String? strInstructions,
    required String? strMealThumb,
    required String? strTags,
    required String? strYoutube,
    required List<String>? ingredient,
    // required String? strIngredient1,
    // required String? strIngredient2,
    // required String? strIngredient3,
    // required String? strIngredient4,
    // required String? strIngredient5,
    // required String? strIngredient6,
    // required String? strIngredient7,
    // required String? strIngredient8,
    // required String? strIngredient9,
    // required String? strIngredient10,
    // required String? strIngredient11,
    // required String? strIngredient12,
    // required String? strIngredient13,
    // required String? strIngredient14,
    // required String? strIngredient15,
    // required String? strIngredient16,
    // required String? strIngredient17,
    // required String? strIngredient18,
    // required String? strIngredient19,
    // required String? strIngredient20,

    required List<String>? measure,
    // required String? strMeasure1,
    // required String? strMeasure2,
    // required String? strMeasure3,
    // required String? strMeasure4,
    // required String? strMeasure5,
    // required String? strMeasure6,
    // required String? strMeasure7,
    // required String? strMeasure8,
    // required String? strMeasure9,
    // required String? strMeasure10,
    // required String? strMeasure11,
    // required String? strMeasure12,
    // required String? strMeasure13,
    // required String? strMeasure14,
    // required String? strMeasure15,
    // required String? strMeasure16,
    // required String? strMeasure17,
    // required String? strMeasure18,
    // required String? strMeasure19,
    // required String? strMeasure20,

    required String? strSource,
    required String? strImageSource,
    required String? strCreativeCommonsConfirmed,
    required String? dateModified,
  }) : super(
          idMeal,
          strMeal,
          strDrinkAlternate,
          strCategory,
          strArea,
          strInstructions,
          strMealThumb,
          strTags,
          strYoutube,
          ingredient,
          // strIngredient1,
          // strIngredient2,
          // strIngredient3,
          // strIngredient4,
          // strIngredient5,
          // strIngredient6,
          // strIngredient7,
          // strIngredient8,
          // strIngredient9,
          // strIngredient10,
          // strIngredient11,
          // strIngredient12,
          // strIngredient13,
          // strIngredient14,
          // strIngredient15,
          // strIngredient16,
          // strIngredient17,
          // strIngredient18,
          // strIngredient19,
          // strIngredient20,
          measure,

          // strMeasure1,
          // strMeasure2,
          // strMeasure3,
          // strMeasure4,
          // strMeasure5,
          // strMeasure6,
          // strMeasure7,
          // strMeasure8,
          // strMeasure9,
          // strMeasure10,
          // strMeasure11,
          // strMeasure12,
          // strMeasure13,
          // strMeasure14,
          // strMeasure15,
          // strMeasure16,
          // strMeasure17,
          // strMeasure18,
          // strMeasure19,
          // strMeasure20,
          strSource,
          strImageSource,
          strCreativeCommonsConfirmed,
          dateModified,
        );

  factory RecipeDetailModels.fromJson(Map<String, dynamic> json) {

    List<String> ingri = [];
    List<String> measu = [];
    for(int i = 1; i <= 20; i++){
      if(json['strIngredient$i'] != null){
        ingri.add(json['strIngredient$i']);
      }
      if(json['strMeasure$i'] != null){
        measu.add(json['strMeasure$i']);
      }
    }

    return RecipeDetailModels(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strDrinkAlternate: json['strDrinkAlternate'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      ingredient: ingri,
      // strIngredient1: json['strIngredient1'],
      // strIngredient2: json['strIngredient2'],
      // strIngredient3: json['strIngredient3'],
      // strIngredient4: json['strIngredient4'],
      // strIngredient5: json['strIngredient5'],
      // strIngredient6: json['strIngredient6'],
      // strIngredient7: json['strIngredient7'],
      // strIngredient8: json['strIngredient8'],
      // strIngredient9: json['strIngredient9'],
      // strIngredient10: json['strIngredient10'],
      // strIngredient11: json['strIngredient11'],
      // strIngredient12: json['strIngredient12'],
      // strIngredient13: json['strIngredient13'],
      // strIngredient14: json['strIngredient14'],
      // strIngredient15: json['strIngredient15'],
      // strIngredient16: json['strIngredient16'],
      // strIngredient17: json['strIngredient17'],
      // strIngredient18: json['strIngredient18'],
      // strIngredient19: json['strIngredient19'],
      // strIngredient20: json['strIngredient20'],
      measure: measu,
      // strMeasure1: json['strMeasure1'],
      // strMeasure2: json['strMeasure2'],
      // strMeasure3: json['strMeasure3'],
      // strMeasure4: json['strMeasure4'],
      // strMeasure5: json['strMeasure5'],
      // strMeasure6: json['strMeasure6'],
      // strMeasure7: json['strMeasure7'],
      // strMeasure8: json['strMeasure8'],
      // strMeasure9: json['strMeasure9'],
      // strMeasure10: json['strMeasure10'],
      // strMeasure11: json['strMeasure11'],
      // strMeasure12: json['strMeasure12'],
      // strMeasure13: json['strMeasure13'],
      // strMeasure14: json['strMeasure14'],
      // strMeasure15: json['strMeasure15'],
      // strMeasure16: json['strMeasure16'],
      // strMeasure17: json['strMeasure17'],
      // strMeasure18: json['strMeasure18'],
      // strMeasure19: json['strMeasure19'],
      // strMeasure20: json['strMeasure20'],
      strSource: json['strSource'],
      strImageSource: json['strImageSource'],
      strCreativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
      dateModified: json['dateModified'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idMeal'] = idMeal;
    data['strMeal'] = strMeal;
    data['strDrinkAlternate'] = strDrinkAlternate;
    data['strCategory'] = strCategory;
    data['strArea'] = strArea;
    data['strInstructions'] = strInstructions;
    data['strMealThumb'] = strMealThumb;
    data['strTags'] = strTags;
    data['strYoutube'] = strYoutube;
    for(int i = 1; i <= 20; i++){
      data['strIngredient$i'] = ingredient?[(i - 1)];
      data['strMeasure$i'] = measure?[(i - 1)];
    }
    // data['strIngredient1'] = strIngredient1;
    // data['strIngredient2'] = strIngredient2;
    // data['strIngredient3'] = strIngredient3;
    // data['strIngredient4'] = strIngredient4;
    // data['strIngredient5'] = strIngredient5;
    // data['strIngredient6'] = strIngredient6;
    // data['strIngredient7'] = strIngredient7;
    // data['strIngredient8'] = strIngredient8;
    // data['strIngredient9'] = strIngredient9;
    // data['strIngredient10'] = strIngredient10;
    // data['strIngredient11'] = strIngredient11;
    // data['strIngredient12'] = strIngredient12;
    // data['strIngredient13'] = strIngredient13;
    // data['strIngredient14'] = strIngredient14;
    // data['strIngredient15'] = strIngredient15;
    // data['strIngredient16'] = strIngredient16;
    // data['strIngredient17'] = strIngredient17;
    // data['strIngredient18'] = strIngredient18;
    // data['strIngredient19'] = strIngredient19;
    // data['strIngredient20'] = strIngredient20;
    // data['strMeasure1'] = strMeasure1;
    // data['strMeasure2'] = strMeasure2;
    // data['strMeasure3'] = strMeasure3;
    // data['strMeasure4'] = strMeasure4;
    // data['strMeasure5'] = strMeasure5;
    // data['strMeasure6'] = strMeasure6;
    // data['strMeasure7'] = strMeasure7;
    // data['strMeasure8'] = strMeasure8;
    // data['strMeasure9'] = strMeasure9;
    // data['strMeasure10'] = strMeasure10;
    // data['strMeasure11'] = strMeasure11;
    // data['strMeasure12'] = strMeasure12;
    // data['strMeasure13'] = strMeasure13;
    // data['strMeasure14'] = strMeasure14;
    // data['strMeasure15'] = strMeasure15;
    // data['strMeasure16'] = strMeasure16;
    // data['strMeasure17'] = strMeasure17;
    // data['strMeasure18'] = strMeasure18;
    // data['strMeasure19'] = strMeasure19;
    // data['strMeasure20'] = strMeasure20;
    data['strSource'] = strSource;
    data['strImageSource'] = strImageSource;
    data['strCreativeCommonsConfirmed'] = strCreativeCommonsConfirmed;
    data['dateModified'] = dateModified;
    return data;
  }
}
