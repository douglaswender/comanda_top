import 'package:comanda_top/src/domain/entities/table_entity.dart';
import 'package:comanda_top/src/shared/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class TableRepository {
  Future<Either<Failure, List<TableEntity>>> getTables();
  Future<Either<Failure, int>> addTable({required TableEntity table});
}
