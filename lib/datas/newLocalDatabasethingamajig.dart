import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'orders.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            '''
          CREATE TABLE orders(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            image TEXT,
            title TEXT,
            description TEXT
          )
          '''
        );
      },
    );
  }

  Future<int> insertOrder(Map<String, dynamic> order) async {
    final db = await database;
    int id = await db.insert('orders', order);
    print('Inserted order with id: $id');  // Print the index after insertion
    return id;
  }

  Future<List<Map<String, dynamic>>> getOrders() async {
    final db = await database;
    return await db.query('orders');
  }

  Future<int> deleteOrder(int id) async {
    final db = await database;
    int rowsDeleted = await db.delete('orders', where: 'id = ?', whereArgs: [id]);
    print('Deleted order with id: $id');  // Print the index after deletion
    return rowsDeleted;
  }

  Future<int> clearOrders() async {
    final db = await database;
    // Drop the table
    await db.execute('DROP TABLE IF EXISTS orders');
    // Recreate the table
    await db.execute('''
    CREATE TABLE orders(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      image TEXT,
      title TEXT,
      description TEXT
    )
  ''');
    print('Orders cleared and index reset');
    return 1;
  }

}
