import 'package:comanda_top/src/domain/entities/product_entity.dart';
import 'package:comanda_top/src/domain/repositories/product_repository.dart';
import 'package:comanda_top/src/shared/failure.dart';
import 'package:dartz/dartz.dart';

final class SaveProductUsecase {
  final ProductRepository _repository;

  SaveProductUsecase({required ProductRepository repository})
      : _repository = repository;

  Future<Either<Failure, void>> call({required ProductEntity productEntity}) =>
      _repository.saveProduct(productEntity: productEntity);
}
