import 'package:comanda_top/src/data/datasources/product_datasource.dart';
import 'package:comanda_top/src/data/models/product_model.dart';
import 'package:comanda_top/src/domain/entities/product_entity.dart';
import 'package:comanda_top/src/domain/repositories/product_repository.dart';
import 'package:comanda_top/src/shared/failure.dart';
import 'package:dartz/dartz.dart';

final class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource _datasource;

  ProductRepositoryImpl({required ProductDatasource datasource})
      : _datasource = datasource;
  @override
  Future<Either<Failure, ProductEntity>> getProduct({required int id}) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      return Right(await _datasource.getProducts());
    } catch (e, stacktrace) {
      return Left(Failure(e, stacktrace));
    }
  }

  @override
  Future<Either<Failure, void>> saveProduct(
      {required ProductEntity productEntity}) async {
    try {
      final id = await _datasource.saveProduct(
          productModel: ProductModel.fromEntity(productEntity));
      if (id == 0) {
        throw Exception('ERRO AO INSERIR PRODUTO');
      }
      return const Right(null);
    } catch (e, stacktrace) {
      return Left(Failure(e, stacktrace));
    }
  }
}
