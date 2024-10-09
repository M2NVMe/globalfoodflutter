import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

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
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE orders(id INTEGER PRIMARY KEY, image TEXT, title TEXT, description TEXT)',
        );
      },
    );
  }

  Future<void> insertOrder(Map<String, dynamic> order) async {
    final db = await database;
    await db.insert('orders', order, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getOrders() async {
    final db = await database;
    return await db.query('orders');
  }

  Future<void> deleteOrder(int id) async {
    final db = await database;
    await db.delete('orders', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> clearOrders() async {
    final db = await database;
    await db.delete('orders');
  }
}
