import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:dpbo/models/UserModel.dart';
import 'JemputSampahModel.dart';

class DatabaseHelper {
  final database = 'ecowaste.db';
  String users_table = 'CREATE TABLE users (user_id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT UNIQUE, password TEXT)';
  String jemput_sampah_table = "CREATE TABLE jemput_sampah (jemput_id INTEGER PRIMARY KEY AUTOINCREMENT, order_number TEXT UNIQUE, alamat TEXT, jenis_sampah TEXT, keterangan TEXT, berat_sampah REAL, pickup_method TEXT, ongkir REAL, biaya_layanan REAL, total REAL, status TEXT DEFAULT 'Diproses')";

  Future<Database> initDB() async {
    final database_path = await getDatabasesPath();
    final path = join(database_path, database);
    return openDatabase(path, version: 2, onCreate: (db, version) async {
      await db.execute(users_table);
      await db.execute(jemput_sampah_table);
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < 2) {
        await db.execute(jemput_sampah_table);
      }
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

  Future<int> submitFormJemput(JemputSampah order) async {
    final db = await initDB();
    return db.insert('jemput_sampah', order.toMap());
  }

  Future<List<JemputSampah>> getJemputSampah() async {
    final db = await initDB();
    final List<Map<String, Object?>> results = await db.rawQuery('SELECT * FROM jemput_sampah');
    return results.map((e) => JemputSampah.fromMap(e)).toList();
  }
}