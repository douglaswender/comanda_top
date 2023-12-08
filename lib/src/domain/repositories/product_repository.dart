import 'package:comanda_top/src/domain/entities/product_entity.dart';
import 'package:comanda_top/src/shared/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, ProductEntity>> getProduct({required int id});
  Future<Either<Failure, void>> saveProduct(
      {required ProductEntity productEntity});
}
