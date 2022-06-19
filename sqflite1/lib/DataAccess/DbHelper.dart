import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Product.dart';

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

  Future<List<Product>> getProducts() async {
    Database db = await getDb;
    var result = await db.query('Products');
    return result.map((e) => Product.toObject(e)).toList();
    // List.generate(result.length, (index) => {
    //   return Product.toObject(result[index]);
    // });
  }

  Future<int> insert(Product product) async {
    Database db = await getDb;
    var result = await db.insert('Products', product.toMap());
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await getDb;
    //var result = await db.delete('Products', where: 'id = ?', whereArgs: [product.id]);
    var result = await db.rawDelete('delete from Products where id = $id');
    return result;
  }

  Future<int> update(Product product) async {
    Database db = await getDb;
    var result = await db.update('Products', product.toMap(),
        where: 'id=?', whereArgs: [product.id]);
    return result;
  }
}
