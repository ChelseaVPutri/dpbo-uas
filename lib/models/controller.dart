import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:dpbo/models/UserModel.dart';

class DatabaseHelper {
  final database = 'ecowaste.db';
  String users_table = 'CREATE TABLE users (user_id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT UNIQUE, password TEXT)';

  Future<Database> initDB() async {
    final database_path = await getDatabasesPath();
    final path = join(database_path, database);
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users_table);
    });
  }

  Future<bool> login(Users user) async {
    final db = await initDB();
    var result = await db.rawQuery("SELECT * FROM users WHERE username = '${user.username}' AND password = '${user.password}'");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<int> register(Users user) async {
    final db = await initDB();
    return db.insert('users', user.toMap());
  }
}