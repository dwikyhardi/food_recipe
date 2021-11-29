// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_list_table.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class RecipeListTableData extends DataClass
    implements Insertable<RecipeListTableData> {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final String strCategory;
  RecipeListTableData(
      {required this.idMeal,
      required this.strMeal,
      required this.strMealThumb,
      required this.strCategory});
  factory RecipeListTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RecipeListTableData(
      idMeal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_meal'])!,
      strMeal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_meal'])!,
      strMealThumb: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_meal_thumb'])!,
      strCategory: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}str_category'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_meal'] = Variable<String>(idMeal);
    map['str_meal'] = Variable<String>(strMeal);
    map['str_meal_thumb'] = Variable<String>(strMealThumb);
    map['str_category'] = Variable<String>(strCategory);
    return map;
  }

  RecipeListTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeListTableCompanion(
      idMeal: Value(idMeal),
      strMeal: Value(strMeal),
      strMealThumb: Value(strMealThumb),
      strCategory: Value(strCategory),
    );
  }

  factory RecipeListTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RecipeListTableData(
      idMeal: serializer.fromJson<String>(json['idMeal']),
      strMeal: serializer.fromJson<String>(json['strMeal']),
      strMealThumb: serializer.fromJson<String>(json['strMealThumb']),
      strCategory: serializer.fromJson<String>(json['strCategory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMeal': serializer.toJson<String>(idMeal),
      'strMeal': serializer.toJson<String>(strMeal),
      'strMealThumb': serializer.toJson<String>(strMealThumb),
      'strCategory': serializer.toJson<String>(strCategory),
    };
  }

  RecipeListTableData copyWith(
          {String? idMeal,
          String? strMeal,
          String? strMealThumb,
          String? strCategory}) =>
      RecipeListTableData(
        idMeal: idMeal ?? this.idMeal,
        strMeal: strMeal ?? this.strMeal,
        strMealThumb: strMealThumb ?? this.strMealThumb,
        strCategory: strCategory ?? this.strCategory,
      );
  @override
  String toString() {
    return (StringBuffer('RecipeListTableData(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb, ')
          ..write('strCategory: $strCategory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idMeal, strMeal, strMealThumb, strCategory);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeListTableData &&
          other.idMeal == this.idMeal &&
          other.strMeal == this.strMeal &&
          other.strMealThumb == this.strMealThumb &&
          other.strCategory == this.strCategory);
}

class RecipeListTableCompanion extends UpdateCompanion<RecipeListTableData> {
  final Value<String> idMeal;
  final Value<String> strMeal;
  final Value<String> strMealThumb;
  final Value<String> strCategory;
  const RecipeListTableCompanion({
    this.idMeal = const Value.absent(),
    this.strMeal = const Value.absent(),
    this.strMealThumb = const Value.absent(),
    this.strCategory = const Value.absent(),
  });
  RecipeListTableCompanion.insert({
    required String idMeal,
    required String strMeal,
    required String strMealThumb,
    required String strCategory,
  })  : idMeal = Value(idMeal),
        strMeal = Value(strMeal),
        strMealThumb = Value(strMealThumb),
        strCategory = Value(strCategory);
  static Insertable<RecipeListTableData> custom({
    Expression<String>? idMeal,
    Expression<String>? strMeal,
    Expression<String>? strMealThumb,
    Expression<String>? strCategory,
  }) {
    return RawValuesInsertable({
      if (idMeal != null) 'id_meal': idMeal,
      if (strMeal != null) 'str_meal': strMeal,
      if (strMealThumb != null) 'str_meal_thumb': strMealThumb,
      if (strCategory != null) 'str_category': strCategory,
    });
  }

  RecipeListTableCompanion copyWith(
      {Value<String>? idMeal,
      Value<String>? strMeal,
      Value<String>? strMealThumb,
      Value<String>? strCategory}) {
    return RecipeListTableCompanion(
      idMeal: idMeal ?? this.idMeal,
      strMeal: strMeal ?? this.strMeal,
      strMealThumb: strMealThumb ?? this.strMealThumb,
      strCategory: strCategory ?? this.strCategory,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    if (strMeal.present) {
      map['str_meal'] = Variable<String>(strMeal.value);
    }
    if (strMealThumb.present) {
      map['str_meal_thumb'] = Variable<String>(strMealThumb.value);
    }
    if (strCategory.present) {
      map['str_category'] = Variable<String>(strCategory.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeListTableCompanion(')
          ..write('idMeal: $idMeal, ')
          ..write('strMeal: $strMeal, ')
          ..write('strMealThumb: $strMealThumb, ')
          ..write('strCategory: $strCategory')
          ..write(')'))
        .toString();
  }
}

class $RecipeListTableTable extends RecipeListTable
    with TableInfo<$RecipeListTableTable, RecipeListTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RecipeListTableTable(this._db, [this._alias]);
  final VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  late final GeneratedColumn<String?> idMeal = GeneratedColumn<String?>(
      'id_meal', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _strMealMeta = const VerificationMeta('strMeal');
  late final GeneratedColumn<String?> strMeal = GeneratedColumn<String?>(
      'str_meal', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _strMealThumbMeta =
      const VerificationMeta('strMealThumb');
  late final GeneratedColumn<String?> strMealThumb = GeneratedColumn<String?>(
      'str_meal_thumb', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _strCategoryMeta =
      const VerificationMeta('strCategory');
  late final GeneratedColumn<String?> strCategory = GeneratedColumn<String?>(
      'str_category', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idMeal, strMeal, strMealThumb, strCategory];
  @override
  String get aliasedName => _alias ?? 'recipe_list_table';
  @override
  String get actualTableName => 'recipe_list_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<RecipeListTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    if (data.containsKey('str_meal')) {
      context.handle(_strMealMeta,
          strMeal.isAcceptableOrUnknown(data['str_meal']!, _strMealMeta));
    } else if (isInserting) {
      context.missing(_strMealMeta);
    }
    if (data.containsKey('str_meal_thumb')) {
      context.handle(
          _strMealThumbMeta,
          strMealThumb.isAcceptableOrUnknown(
              data['str_meal_thumb']!, _strMealThumbMeta));
    } else if (isInserting) {
      context.missing(_strMealThumbMeta);
    }
    if (data.containsKey('str_category')) {
      context.handle(
          _strCategoryMeta,
          strCategory.isAcceptableOrUnknown(
              data['str_category']!, _strCategoryMeta));
    } else if (isInserting) {
      context.missing(_strCategoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idMeal};
  @override
  RecipeListTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RecipeListTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RecipeListTableTable createAlias(String alias) {
    return $RecipeListTableTable(_db, alias);
  }
}

class FavouriteRecipeListTableData extends DataClass
    implements Insertable<FavouriteRecipeListTableData> {
  final String idMeal;
  FavouriteRecipeListTableData({required this.idMeal});
  factory FavouriteRecipeListTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FavouriteRecipeListTableData(
      idMeal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_meal'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_meal'] = Variable<String>(idMeal);
    return map;
  }

  FavouriteRecipeListTableCompanion toCompanion(bool nullToAbsent) {
    return FavouriteRecipeListTableCompanion(
      idMeal: Value(idMeal),
    );
  }

  factory FavouriteRecipeListTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FavouriteRecipeListTableData(
      idMeal: serializer.fromJson<String>(json['idMeal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idMeal': serializer.toJson<String>(idMeal),
    };
  }

  FavouriteRecipeListTableData copyWith({String? idMeal}) =>
      FavouriteRecipeListTableData(
        idMeal: idMeal ?? this.idMeal,
      );
  @override
  String toString() {
    return (StringBuffer('FavouriteRecipeListTableData(')
          ..write('idMeal: $idMeal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => idMeal.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavouriteRecipeListTableData && other.idMeal == this.idMeal);
}

class FavouriteRecipeListTableCompanion
    extends UpdateCompanion<FavouriteRecipeListTableData> {
  final Value<String> idMeal;
  const FavouriteRecipeListTableCompanion({
    this.idMeal = const Value.absent(),
  });
  FavouriteRecipeListTableCompanion.insert({
    required String idMeal,
  }) : idMeal = Value(idMeal);
  static Insertable<FavouriteRecipeListTableData> custom({
    Expression<String>? idMeal,
  }) {
    return RawValuesInsertable({
      if (idMeal != null) 'id_meal': idMeal,
    });
  }

  FavouriteRecipeListTableCompanion copyWith({Value<String>? idMeal}) {
    return FavouriteRecipeListTableCompanion(
      idMeal: idMeal ?? this.idMeal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idMeal.present) {
      map['id_meal'] = Variable<String>(idMeal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavouriteRecipeListTableCompanion(')
          ..write('idMeal: $idMeal')
          ..write(')'))
        .toString();
  }
}

class $FavouriteRecipeListTableTable extends FavouriteRecipeListTable
    with
        TableInfo<$FavouriteRecipeListTableTable,
            FavouriteRecipeListTableData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FavouriteRecipeListTableTable(this._db, [this._alias]);
  final VerificationMeta _idMealMeta = const VerificationMeta('idMeal');
  late final GeneratedColumn<String?> idMeal = GeneratedColumn<String?>(
      'id_meal', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [idMeal];
  @override
  String get aliasedName => _alias ?? 'favourite_recipe_list_table';
  @override
  String get actualTableName => 'favourite_recipe_list_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<FavouriteRecipeListTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_meal')) {
      context.handle(_idMealMeta,
          idMeal.isAcceptableOrUnknown(data['id_meal']!, _idMealMeta));
    } else if (isInserting) {
      context.missing(_idMealMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idMeal};
  @override
  FavouriteRecipeListTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return FavouriteRecipeListTableData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FavouriteRecipeListTableTable createAlias(String alias) {
    return $FavouriteRecipeListTableTable(_db, alias);
  }
}

abstract class _$RecipeListDatabase extends GeneratedDatabase {
  _$RecipeListDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $RecipeListTableTable recipeListTable =
      $RecipeListTableTable(this);
  late final $FavouriteRecipeListTableTable favouriteRecipeListTable =
      $FavouriteRecipeListTableTable(this);
  late final RecipeListDao recipeListDao =
      RecipeListDao(this as RecipeListDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [recipeListTable, favouriteRecipeListTable];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$RecipeListDaoMixin on DatabaseAccessor<RecipeListDatabase> {
  $RecipeListTableTable get recipeListTable => attachedDatabase.recipeListTable;
  $FavouriteRecipeListTableTable get favouriteRecipeListTable =>
      attachedDatabase.favouriteRecipeListTable;
}
