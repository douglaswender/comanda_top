import 'package:comanda_top/src/domain/entities/order_entity.dart';
import 'package:comanda_top/src/domain/repositories/table_repository.dart';
import 'package:comanda_top/src/shared/failure.dart';
import 'package:dartz/dartz.dart';

final class GetOrderByTableUsecase {
  final TableRepository _repository;

  GetOrderByTableUsecase({required TableRepository repository})
      : _repository = repository;

  Future<Either<Failure, List<OrderEntity>>> call({required int mesaId}) =>
      _repository.getOrder(mesaId: mesaId);
}
