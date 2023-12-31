import 'package:comanda_top/src/data/models/order_model.dart';
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

  Future<List<OrderModel>> getOrder({required int mesaId}) async {
    return (await _databaseHelper.sqlQuery(
            sql:
                'SELECT i.nome AS item_nome, pi.quantidade, pi.subtotal FROM pedido_item pi JOIN item_menu i ON pi.item_id = i.id JOIN pedido p on p.id = pi.pedido_id WHERE p.mesa_id = 1 AND p.status = "aberto"'))
        .map((e) => OrderModel.fromMap(e))
        .toList();
  }
}
