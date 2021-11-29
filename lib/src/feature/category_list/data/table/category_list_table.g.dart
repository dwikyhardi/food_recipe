// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list_table.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CategoryListTable extends DataClass
    implements Insertable<CategoryListTable> {
  final String category;
  CategoryListTable({required this.category});
  factory CategoryListTable.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CategoryListTable(
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meals'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['meals'] = Variable<String>(category);
    return map;
  }

  CategoryListTablesCompanion toCompanion(bool nullToAbsent) {
    return CategoryListTablesCompanion(
      category: Value(category),
    );
  }

  factory CategoryListTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CategoryListTable(
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'category': serializer.toJson<String>(category),
    };
  }

  CategoryListTable copyWith({String? category}) => CategoryListTable(
        category: category ?? this.category,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryListTable(')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => category.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryListTable && other.category == this.category);
}

class CategoryListTablesCompanion extends UpdateCompanion<CategoryListTable> {
  final Value<String> category;
  const CategoryListTablesCompanion({
    this.category = const Value.absent(),
  });
  CategoryListTablesCompanion.insert({
    required String category,
  }) : category = Value(category);
  static Insertable<CategoryListTable> custom({
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (category != null) 'meals': category,
    });
  }

  CategoryListTablesCompanion copyWith({Value<String>? category}) {
    return CategoryListTablesCompanion(
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (category.present) {
      map['meals'] = Variable<String>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryListTablesCompanion(')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class $CategoryListTablesTable extends CategoryListTables
    with TableInfo<$CategoryListTablesTable, CategoryListTable> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CategoryListTablesTable(this._db, [this._alias]);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'meals', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [category];
  @override
  String get aliasedName => _alias ?? 'category_list_tables';
  @override
  String get actualTableName => 'category_list_tables';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryListTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('meals')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['meals']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {category};
  @override
  CategoryListTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CategoryListTable.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoryListTablesTable createAlias(String alias) {
    return $CategoryListTablesTable(_db, alias);
  }
}

class CategoryTable extends DataClass implements Insertable<CategoryTable> {
  final String strCategory;
  CategoryTable({required this.strCategory});
  factory CategoryTable.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CategoryTable(
      strCategory: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}strCategory'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['strCategory'] = Variable<String>(strCategory);
    return map;
  }

  CategoryTablesCompanion toCompanion(bool nullToAbsent) {
    return CategoryTablesCompanion(
      strCategory: Value(strCategory),
    );
  }

  factory CategoryTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CategoryTable(
      strCategory: serializer.fromJson<String>(json['strCategory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'strCategory': serializer.toJson<String>(strCategory),
    };
  }

  CategoryTable copyWith({String? strCategory}) => CategoryTable(
        strCategory: strCategory ?? this.strCategory,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryTable(')
          ..write('strCategory: $strCategory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => strCategory.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTable && other.strCategory == this.strCategory);
}

class CategoryTablesCompanion extends UpdateCompanion<CategoryTable> {
  final Value<String> strCategory;
  const CategoryTablesCompanion({
    this.strCategory = const Value.absent(),
  });
  CategoryTablesCompanion.insert({
    required String strCategory,
  }) : strCategory = Value(strCategory);
  static Insertable<CategoryTable> custom({
    Expression<String>? strCategory,
  }) {
    return RawValuesInsertable({
      if (strCategory != null) 'strCategory': strCategory,
    });
  }

  CategoryTablesCompanion copyWith({Value<String>? strCategory}) {
    return CategoryTablesCompanion(
      strCategory: strCategory ?? this.strCategory,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (strCategory.present) {
      map['strCategory'] = Variable<String>(strCategory.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTablesCompanion(')
          ..write('strCategory: $strCategory')
          ..write(')'))
        .toString();
  }
}

class $CategoryTablesTable extends CategoryTables
    with TableInfo<$CategoryTablesTable, CategoryTable> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CategoryTablesTable(this._db, [this._alias]);
  final VerificationMeta _strCategoryMeta =
      const VerificationMeta('strCategory');
  late final GeneratedColumn<String?> strCategory = GeneratedColumn<String?>(
      'strCategory', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [strCategory];
  @override
  String get aliasedName => _alias ?? 'category_tables';
  @override
  String get actualTableName => 'category_tables';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('strCategory')) {
      context.handle(
          _strCategoryMeta,
          strCategory.isAcceptableOrUnknown(
              data['strCategory']!, _strCategoryMeta));
    } else if (isInserting) {
      context.missing(_strCategoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {strCategory};
  @override
  CategoryTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CategoryTable.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CategoryTablesTable createAlias(String alias) {
    return $CategoryTablesTable(_db, alias);
  }
}

abstract class _$CategoryListDatabase extends GeneratedDatabase {
  _$CategoryListDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $CategoryListTablesTable categoryListTables =
      $CategoryListTablesTable(this);
  late final $CategoryTablesTable categoryTables = $CategoryTablesTable(this);
  late final CategoryListDao categoryListDao =
      CategoryListDao(this as CategoryListDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categoryListTables, categoryTables];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$CategoryListDaoMixin on DatabaseAccessor<CategoryListDatabase> {
  $CategoryListTablesTable get categoryListTables =>
      attachedDatabase.categoryListTables;
  $CategoryTablesTable get categoryTables => attachedDatabase.categoryTables;
}
