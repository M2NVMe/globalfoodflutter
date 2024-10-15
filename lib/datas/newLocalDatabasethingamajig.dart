import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper extends GetxController {
  static Database? _db;

  var orders = <Map<String, dynamic>>[].obs;

  // init db thing
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  // init db thing(2)
  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'orders_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE orders(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            image TEXT,
            title TEXT,
            description TEXT
          )
        ''');
      },
    );
  }

  // Insert
  Future<int> addOrder(Map<String, dynamic> order) async {
    var dbClient = await db;
    int result = await dbClient!.insert('orders', order);
    loadOrders();
    return result;
  }

  // Load
  Future<void> loadOrders() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('orders');
    orders.assignAll(queryResult);
  }

  // Delete
  Future<void> deleteOrder(int id) async {
    var dbClient = await db;
    await dbClient!.delete('orders', where: 'id = ?', whereArgs: [id]);
    loadOrders();
  }

  // Clear all
  Future<void> clearOrders() async {
    var dbClient = await db;
    await dbClient!.delete('orders');
    loadOrders();
  }
}
