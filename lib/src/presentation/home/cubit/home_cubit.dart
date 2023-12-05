import 'package:bloc/bloc.dart';
import 'package:comanda_top/src/domain/entities/table_entity.dart';
import 'package:comanda_top/src/domain/usecases/get_tables_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetTablesUsecase getTablesUsecase = Modular.get();
  HomeCubit() : super(HomeInitial());

  Future<void> getTables() async {
    emit(HomeLoading());
    final response = await getTablesUsecase();

    response.fold(
      (l) => emit(HomeFailureTables()),
      (r) => emit(HomeLoadedTables(tables: r)),
    );
  }
}
