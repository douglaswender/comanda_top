abstract interface class DatabaseHelper {
  String get databaseName;
  int get databaseVersion;
  Future<int> insert(
      {required Map<String, dynamic> row, required String table});
  Future<List<Map<String, dynamic>>> queryAllRows({required String table});
  Future<Map<String, dynamic>?> queryById(
      {required String table, required int id});
  Future<int> queryRowCount({required String table});
  Future<int> update(
      {required Map<String, dynamic> row, required String table});
  Future<int> delete({required int id, required String table});
  Future<List<Map<String, Object?>>> sqlQuery({required String sql});
}
