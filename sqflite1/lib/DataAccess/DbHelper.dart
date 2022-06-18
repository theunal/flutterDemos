import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Database? db;

  Future<Database> get getDb async {
    if (getDb != null) return getDb;
    db = await initDb();
    return db!;
  }

  Future<Database> initDb() async {
    String dbPath = join(await getDatabasesPath(), 'etrade.db');
    var eTrade = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return eTrade;
  }

  void createDb(Database db, int version) async {
    await db.execute(
        'create table Products(id integer primary key, name text, description text, unitPrice integer)');
  }
}
