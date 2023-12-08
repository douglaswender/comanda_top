import 'package:comanda_top/src/data/models/product_model.dart';
import 'package:comanda_top/src/shared/database_helper.dart';

final class ProductDatasource {
  final DatabaseHelper _databaseHelper;

  ProductDatasource({required DatabaseHelper databaseHelper})
      : _databaseHelper = databaseHelper;

  Future<List<ProductModel>> getProducts() async {
    return (await _databaseHelper.queryAllRows(table: 'item_menu'))
        .map((e) => ProductModel.fromMap(e))
        .toList();
  }

  Future<int> saveProduct({required ProductModel productModel}) async {
    return _databaseHelper.insert(
        row: productModel.toMap(), table: 'item_menu');
  }
}
