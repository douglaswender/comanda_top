import 'package:comanda_top/src/domain/entities/table_entity.dart';
import 'package:comanda_top/src/domain/repositories/table_repository.dart';
import 'package:comanda_top/src/shared/failure.dart';
import 'package:dartz/dartz.dart';

final class GetTablesUsecase {
  final TableRepository _repository;

  GetTablesUsecase({required TableRepository repository})
      : _repository = repository;

  Future<Either<Failure, List<TableEntity>>> call() => _repository.getTables();
}
