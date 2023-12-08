import 'package:comanda_top/src/domain/entities/product_entity.dart';

final class ProductModel extends ProductEntity {
  ProductModel({super.id, required super.nome, required super.preco});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'preco': preco,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      preco: map['preco'] ?? 0,
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      nome: entity.nome,
      preco: entity.preco,
    );
  }
}
