import 'package:comanda_top/src/data/datasources/product_datasource.dart';
import 'package:comanda_top/src/data/datasources/table_datasource.dart';
import 'package:comanda_top/src/data/repositories/product_repository_impl.dart';
import 'package:comanda_top/src/data/repositories/table_repository_impl.dart';
import 'package:comanda_top/src/domain/repositories/product_repository.dart';
import 'package:comanda_top/src/domain/repositories/table_repository.dart';
import 'package:comanda_top/src/domain/usecases/get_order_by_table_usecase.dart';
import 'package:comanda_top/src/domain/usecases/get_products_usecase.dart';
import 'package:comanda_top/src/domain/usecases/get_tables_usecase.dart';
import 'package:comanda_top/src/domain/usecases/save_product_usecase.dart';
import 'package:comanda_top/src/domain/usecases/save_table_usecase.dart';
import 'package:comanda_top/src/presentation/home/home_page.dart';
import 'package:comanda_top/src/presentation/menu/menu_page.dart';
import 'package:comanda_top/src/presentation/table/table_page.dart';
import 'package:comanda_top/src/shared/database_helper.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  final DatabaseHelper databaseHelper;

  AppModule({required this.databaseHelper});
  @override
  void binds(Injector i) {
    i.addInstance<DatabaseHelper>(databaseHelper);
    i.addLazySingleton<TableDatasource>(TableDatasource.new);
    i.addLazySingleton<TableRepository>(TableRepositoryImpl.new);
    i.addLazySingleton<ProductDatasource>(ProductDatasource.new);
    i.addLazySingleton<ProductRepository>(ProductRepositoryImpl.new);
    i.addLazySingleton(GetTablesUsecase.new);
    i.addLazySingleton(SaveProductUsecase.new);
    i.addLazySingleton(GetProductsUsecase.new);
    i.addLazySingleton(SaveTableUsecase.new);
    i.addLazySingleton(GetOrderByTableUsecase.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const HomePage(),
    );
    r.child(
      '/table/:id',
      child: (context) => TablePage(mesaId: int.parse(r.args.params['id'])),
    );
    r.child(
      '/menu',
      child: (context) => const MenuPage(),
    );
  }
}
