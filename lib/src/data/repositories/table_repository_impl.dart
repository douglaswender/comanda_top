import 'package:comanda_top/src/data/datasources/table_datasource.dart';
import 'package:comanda_top/src/data/models/table_model.dart';
import 'package:comanda_top/src/domain/entities/order_entity.dart';
import 'package:comanda_top/src/domain/entities/table_entity.dart';
import 'package:comanda_top/src/domain/repositories/table_repository.dart';
import 'package:comanda_top/src/shared/failure.dart';
import 'package:dartz/dartz.dart';

final class TableRepositoryImpl implements TableRepository {
  final TableDatasource _datasource;

  TableRepositoryImpl({required TableDatasource datasource})
      : _datasource = datasource;
  @override
  Future<Either<Failure, List<TableEntity>>> getTables() async {
    try {
      return Right(await _datasource.getTables());
    } catch (e, stacktrace) {
      return Left(Failure(e, stacktrace));
    }
  }

  @override
  Future<Either<Failure, int>> addTable({required TableEntity table}) async {
    try {
      return Right(
          await _datasource.addTable(table: TableModel.fromEntity(table)));
    } catch (e, stacktrace) {
      return Left(Failure(e, stacktrace));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrder(
      {required int mesaId}) async {
    try {
      return Right(await _datasource.getOrder(mesaId: mesaId));
    } catch (e, stacktrace) {
      return Left(Failure(e, stacktrace));
    }
  }
}
