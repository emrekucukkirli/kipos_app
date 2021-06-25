import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kipos_app/models/recipe_model.dart';

class DatabaseHelper {
  static final _databaseName = "kiposdb.db";
  static final _databaseVersion = 1;
  static final table = "recipe_table";
  static final columnId = "id";
  static final columnName = "name";
  static final columnContent = "content";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnContent TEXT NOT NULL
      )

      ''');
  }

  Future<int> insert(Recipe recipe) async {
    Database db = await instance.database;
    return await db.insert(table, {
      'name': recipe.name,
      'content': recipe.content,
    });
  }

  Future<int> update(Recipe recipe) async {
    Database db = await instance.database;
    int id = recipe.toMap()['id'];
    return await db
        .update(table, recipe.toMap(), where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryRows(name) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnName LIKE '%$name%'");
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }
}
