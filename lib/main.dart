import 'package:constructionChecker/database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:constructionChecker/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  final Database _db = await _dbHelper.database;
  runApp(ModularApp(module: AppModule(_db)));
}
