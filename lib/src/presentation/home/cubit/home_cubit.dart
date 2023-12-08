import 'package:bloc/bloc.dart';
import 'package:comanda_top/src/domain/entities/table_entity.dart';
import 'package:comanda_top/src/domain/usecases/get_tables_usecase.dart';
import 'package:comanda_top/src/domain/usecases/save_table_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetTablesUsecase _getTablesUsecase = Modular.get();
  final SaveTableUsecase _saveTableUsecase = Modular.get();
  HomeCubit() : super(HomeInitial());

  Future<void> getTables() async {
    emit(HomeLoading());
    final response = await _getTablesUsecase();

    response.fold(
      (l) => emit(HomeFailureTables()),
      (r) => emit(HomeLoadedTables(tables: r)),
    );
  }

  Future<void> saveTable({required String nome, required String status}) async {
    emit(HomeAddTableLoading());
    final response =
        await _saveTableUsecase(table: TableEntity(nome: nome, status: status));

    response.fold((l) => emit(HomeFailureTables()), (r) => getTables());
  }
}
