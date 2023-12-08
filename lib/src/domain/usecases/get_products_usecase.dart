import 'package:comanda_top/src/domain/entities/product_entity.dart';
import 'package:comanda_top/src/domain/repositories/product_repository.dart';
import 'package:comanda_top/src/shared/failure.dart';
import 'package:dartz/dartz.dart';

final class GetProductsUsecase {
  final ProductRepository _repository;

  GetProductsUsecase({required ProductRepository repository})
      : _repository = repository;

  Future<Either<Failure, List<ProductEntity>>> call() =>
      _repository.getProducts();
}
