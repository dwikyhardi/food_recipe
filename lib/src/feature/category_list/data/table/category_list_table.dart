import 'package:food_recipe/src/feature/category_list/data/models/category_list_models.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'category_list_table.g.dart';

class CategoryListTables extends Table {
  TextColumn get category => text().named('meals')();

  @override
  Set<Column> get primaryKey => {category};
}

class CategoryTables extends Table {
  TextColumn get strCategory => text().named('strCategory')();

  @override
  Set<Column> get primaryKey => {strCategory};
}

@UseMoor(tables: [CategoryListTables, CategoryTables], daos: [CategoryListDao])
class CategoryListDatabase extends _$CategoryListDatabase {
  CategoryListDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@UseDao(
  tables: [CategoryListTables, CategoryTables],
)
class CategoryListDao extends DatabaseAccessor<CategoryListDatabase>
    with _$CategoryListDaoMixin {
  CategoryListDatabase db;

  CategoryListDao(this.db) : super(db);

  Future<CategoryListTable> getCategoryList() async {
    return await select(categoryListTables).getSingle();
  }

  Future<List<CategoryModels>> getCategories() async {
    List<CategoryModels> categoryList = [];
    List<CategoryTable> data = await select(categoryTables).get();
    for (var element in data) {
      categoryList.add(CategoryModels.fromJson(element.toJson()));
    }

    return categoryList;
  }

  Future<void> saveCategoryList(
      Insertable<CategoryListTable> categoryList) async {
    into(categoryListTables)
        .insert(categoryList, mode: InsertMode.insertOrReplace);
  }
}
