import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper extends GetxController {
  static Database? _db;

  var orders = <Map<String, dynamic>>[].obs;

  // Getter to access the database
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  // Initialize the database
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

  // Insert a new order
  Future<int> addOrder(Map<String, dynamic> order) async {
    var dbClient = await db;
    int result = await dbClient!.insert('orders', order);
    loadOrders(); // Refresh orders after insertion
    return result;
  }

  // Load all orders from the database
  Future<void> loadOrders() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('orders');
    orders.assignAll(queryResult); // Assign the result to the observable list
  }

  // Delete a specific order by ID
  Future<void> deleteOrder(int id) async {
    var dbClient = await db;
    await dbClient!.delete('orders', where: 'id = ?', whereArgs: [id]);
    loadOrders(); // Refresh orders after deletion
  }

  // Clear all orders and reset the table (including resetting the autoincrement index)
  Future<void> clearOrders() async {
    var dbClient = await db;
    await dbClient!.execute('DROP TABLE IF EXISTS orders');
    await dbClient!.execute('''
      CREATE TABLE orders(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        image TEXT,
        title TEXT,
        description TEXT
      )
    ''');
    loadOrders(); // Reload after clearing orders
  }
}
