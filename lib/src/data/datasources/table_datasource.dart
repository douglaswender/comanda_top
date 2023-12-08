import 'package:comanda_top/src/data/models/table_model.dart';
import 'package:comanda_top/src/shared/database_helper.dart';

final class TableDatasource {
  final DatabaseHelper _databaseHelper;

  TableDatasource({required DatabaseHelper databaseHelper})
      : _databaseHelper = databaseHelper;

  Future<List<TableModel>> getTables() async {
    return (await _databaseHelper.queryAllRows(table: 'mesa'))
        .map((e) => TableModel.fromMap(e))
        .toList();
  }

  Future<int> addTable({required TableModel table}) async {
    return await _databaseHelper.insert(row: table.toMap(), table: 'mesa');
  }
}
