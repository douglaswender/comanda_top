import 'package:bloc/bloc.dart';
import 'package:comanda_top/src/domain/usecases/get_order_by_table_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  final GetOrderByTableUsecase getOrderByTableUsecase = Modular.get();
  TableCubit() : super(TableInitial());

  Future<void> getOrder({required int mesaId}) async {
    final response = await getOrderByTableUsecase(mesaId: mesaId);

    response.fold((l) => null, (r) => print(r));
  }
}
