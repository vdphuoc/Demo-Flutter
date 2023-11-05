import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'dart:async';
import '../model/cart_model.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    return _db = await initDatabase();
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationCacheDirectory();

    String path = join(documentDirectory.path, 'cart.db');

    var db = await openDatabase(path, version: 10, onCreate: _onCreate);
    return db;
  }

  // required this.id,
  // required this.productId,
  // required this.productName,
  // required this.initalPrice,
  // required this.productPrice,
  // required this.quanity,
  // required this.unitTag,
  // required this.image,
  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart(id INTEGER PRIMARY KEY, productId VARCHAR UNIQUE,'
        ' productName TEXT, initalPrice INTEGER, productPrice INTEGER,'
        ' quanity INTEGER, unitTag TEXT, image TEXT)');
  }

  Future<Cart> insert(Cart cart) async {
    var dbClient = await db;
    await dbClient!.insert(
      'cart',
      cart.toMap(),
    );
    return cart;
  }

  Future<List<Cart>> getCartList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('cart');
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return dbClient!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateQuanity(Cart cart) async {
    var dbClient = await db;
    return dbClient!.update(
      'cart',
      cart.toMap(),
      where: 'id = ?',
      whereArgs: [cart.id],
    );
  }
}
