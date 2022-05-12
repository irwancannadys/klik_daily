
import 'package:klik_daily/data/fruit_cart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDataBase {

  final String tableCart = 'cart_table';

  static final CartDataBase instance = CartDataBase._init();
  static Database? _database;
  CartDataBase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase('cart.db');
    return _database!;
  }

  Future<Database> _initDatabase(String filePath) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    
    await db.execute('''
CREATE TABLE $tableCart (
 ${CartField.id} $idType,
 ${CartField.name} $textType,
 ${CartField.image} $textType,
 ${CartField.price} $integerType,
 ${CartField.rating} $integerType)
''');
  }

  Future<FruitCart> create(FruitCart fruitCart) async {
    final db = await instance.database;
    final id = await db.insert(tableCart, fruitCart.toJson());
    return fruitCart.copy(id: id);
  }

  Future<List<FruitCart>> readAllFruits() async {
    final db = await instance.database;

    final orderBy = '${CartField.id} DESC';

    final result = await db.query(tableCart, orderBy: orderBy);

    return result.map((json) => FruitCart.fromJson(json)).toList();
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableCart,
      where: '${CartField.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}

class CartField {

  static final String id = '_id';
  static final String name = 'name';
  static final String image = 'image';
  static final String price = 'price';
  static final String rating = 'rating';
}