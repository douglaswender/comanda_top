import 'package:comanda_top/src/shared/database_helper.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final class DatabaseHelperImpl implements DatabaseHelper {
  @override
  String get databaseName => 'comanda_top.db';

  @override
  int get databaseVersion => 1;

  late Database db;

  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, databaseName);
    db = await openDatabase(path, version: databaseVersion, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE mesa (
          id INTEGER PRIMARY KEY,
          nome TEXT NOT NULL,
          status TEXT DEFAULT 'disponivel'
      );
      CREATE TABLE pedido (
          id INTEGER PRIMARY KEY,
          mesa_id INTEGER,
          status TEXT DEFAULT 'aberto',
          total REAL DEFAULT 0,
          FOREIGN KEY (mesa_id) REFERENCES mesa (id)
      );
      CREATE TABLE item_menu (
          id INTEGER PRIMARY KEY,
          nome TEXT NOT NULL,
          preco REAL NOT NULL
      );
      CREATE TABLE pedido_item (
          id INTEGER PRIMARY KEY,
          pedido_id INTEGER,
          item_id INTEGER,
          quantidade INTEGER DEFAULT 1,
          subtotal REAL DEFAULT 0,
          FOREIGN KEY (pedido_id) REFERENCES pedido (id),
          FOREIGN KEY (item_id) REFERENCES item_menu (id)
      );
      ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  @override
  Future<int> insert(
      {required Map<String, dynamic> row, required String table}) async {
    return await db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  @override
  Future<List<Map<String, dynamic>>> queryAllRows(
      {required String table}) async {
    return await db.query(table);
  }

  @override
  Future<Map<String, dynamic>?> queryById(
      {required String table, required int id}) async {
    List<Map<String, dynamic>> result = await db.query(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      // Retorna null se não encontrar uma mesa com o ID especificado.
      return null;
    }
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  @override
  Future<int> queryRowCount({required String table}) async {
    final results = await db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  @override
  Future<int> update(
      {required Map<String, dynamic> row, required String table}) async {
    int id = row['id'];
    return await db.update(
      table,
      row,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  @override
  Future<int> delete({required int id, required String table}) async {
    return await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
