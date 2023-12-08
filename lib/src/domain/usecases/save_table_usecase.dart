import 'package:comanda_top/src/domain/entities/table_entity.dart';
import 'package:comanda_top/src/domain/repositories/table_repository.dart';
import 'package:comanda_top/src/shared/failure.dart';
import 'package:dartz/dartz.dart';

final class SaveTableUsecase {
  final TableRepository _repository;

  SaveTableUsecase({required TableRepository repository})
      : _repository = repository;

  Future<Either<Failure, int>> call({required TableEntity table}) =>
      _repository.addTable(table: table);
}
