import 'dart:async';

import 'package:food_recipe/src/feature/recipe_list/data/models/recipe_list_models.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'recipe_list_table.g.dart';

class RecipeListTable extends Table {
  TextColumn get idMeal => text()();

  TextColumn get strMeal => text()();

  TextColumn get strMealThumb => text()();

  TextColumn get strCategory => text()();

  @override
  Set<Column> get primaryKey => {idMeal};
}

class FavouriteRecipeListTable extends Table {
  TextColumn get idMeal => text()();

  @override
  Set<Column> get primaryKey => {idMeal};
}

@UseMoor(
    tables: [RecipeListTable, FavouriteRecipeListTable], daos: [RecipeListDao])
class RecipeListDatabase extends _$RecipeListDatabase {
  RecipeListDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'recipeDB.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [RecipeListTable, FavouriteRecipeListTable])
class RecipeListDao extends DatabaseAccessor<RecipeListDatabase>
    with _$RecipeListDaoMixin {
  RecipeListDatabase db;

  RecipeListDao(this.db) : super(db);

  Future<List<RecipeListModels>> getRecipeList(
      {required String category}) async {
    List<RecipeListModels> categoryList = [];
    List<RecipeListTableData> data = await (select(recipeListTable)
          ..where((tbl) => tbl.strCategory.equals(category)))
        .get();
    for (var element in data) {
      categoryList.add(RecipeListModels.fromJson(element.toJson()));
    }

    return categoryList;
  }

  Future<List<RecipeListModels>> getFavouriteRecipeList() async {
    List<RecipeListModels> categoryList = [];
    List<RecipeListTableData> data = [];
    await select(favouriteRecipeListTable).get().then((fav) async {
      for (var element in fav) {
        data.addAll(await (select(recipeListTable)
              ..where((tbl) => tbl.idMeal.equals(element.idMeal)))
            .get());
      }
    });
    for (var element in data) {
      categoryList.add(RecipeListModels.fromJson(element.toJson()));
    }

    return categoryList;
  }

  Stream<List<RecipeListModels>> streamFavouriteRecipeList() async* {
    StreamTransformer<List<FavouriteRecipeListTableData>,
            List<RecipeListModels>> transformer =
        StreamTransformer.fromHandlers(handleData:
            (List<FavouriteRecipeListTableData> event,
                EventSink<List<RecipeListModels>> output) async {
      List<RecipeListModels> categoryList = [];
      List<RecipeListTableData> data = [];
      for(var element in event){
        data.addAll(await (select(recipeListTable)
          ..where((tbl) => tbl.idMeal.equals(element.idMeal))).get());
      }

      for (var element in data) {
        categoryList.add(RecipeListModels.fromJson(element.toJson()));
      }
      output.add(categoryList);
    });

    // List<RecipeListTableData> data = [];

    yield* select(favouriteRecipeListTable).watch().transform(transformer);

    // select(favouriteRecipeListTable).watch().listen((event) async*{
    //   for(var element in event){
    //     (select(recipeListTable)
    //       ..where((tbl) => tbl.idMeal.equals(element.idMeal))).watch();
    //   }
    // });

    // await select(favouriteRecipeListTable).get().then((fav) async {
    //   for (var element in fav) {
    //     data.addAll(await (select(recipeListTable)
    //       ..where((tbl) => tbl.idMeal.equals(element.idMeal)))
    //         .get());
    //   }
    // });

  }

  Stream<List<String>> streamFavouriteRecipeListId() async* {
    StreamTransformer<List<FavouriteRecipeListTableData>, List<String>>
        transformer = StreamTransformer.fromHandlers(handleData:
            (List<FavouriteRecipeListTableData> event, EventSink output) {
      List<String> data = [];
      for (var element in event) {
        data.add(element.idMeal);
      }
      output.add(data);
    });

    yield* select(favouriteRecipeListTable).watch().transform(transformer);
  }

  Future<void> saveFavouriteRecipe(
      Insertable<FavouriteRecipeListTableData> fav) async {
    await into(favouriteRecipeListTable)
        .insert(fav, mode: InsertMode.insertOrReplace);
  }

  Future<void> removeFavouriteRecipe(String idMeal) async {
    (delete(favouriteRecipeListTable)
          ..where((tbl) => tbl.idMeal.equals(idMeal)))
        .go();
  }

  Future<void> saveRecipeList(
      Insertable<RecipeListTableData> recipeList) async {
    await into(recipeListTable)
        .insert(recipeList, mode: InsertMode.insertOrReplace);
  }
}
