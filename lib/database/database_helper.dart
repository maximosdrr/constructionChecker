import 'dart:io';
import 'package:constructionChecker/database/sql.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _dbName = 'constructionCheckerApp2.db';
  static final _version = 2;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // instancia o db na primeira vez que for acessado
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(path,
        version: _version, onCreate: _onCreate, onOpen: _onOpen);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(DatabaseSql.createTableWork);
    await db.execute(DatabaseSql.createTableCheckList);
    await db.execute(DatabaseSql.createTableCornerStone);
    await db.execute(DatabaseSql.createTableWorkCornerStone);
  }

  Future _onOpen(Database db) async {
    // DROP TABLES
    // await db.execute(DatabaseSql.dropTableCheckList);
    // await db.execute(DatabaseSql.dropTableWorkCornerStone);
    // await db.execute(DatabaseSql.dropTableWork);
    // await db.execute(DatabaseSql.dropTableConerStone);

    // // CREATE TABLES
    // await db.execute(DatabaseSql.createTableWork);
    // await db.execute(DatabaseSql.createTableCornerStone);
    // await db.execute(DatabaseSql.createTableCheckList);
    // await db.execute(DatabaseSql.createTableWorkCornerStone);
  }
}
