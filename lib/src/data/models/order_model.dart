import 'package:comanda_top/src/domain/entities/order_entity.dart';

final class OrderModel extends OrderEntity {
  OrderModel({
    required super.nome,
    required super.subtotal,
    required super.quantidade,
  });

  Map<String, dynamic> toMap() {
    return {
      'quantidade': quantidade,
      'item_nome': nome,
      'subtotal': subtotal,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      quantidade: map['quantidade']?.toInt(),
      nome: map['item_nome'] ?? '',
      subtotal: map['subtotal']?.toDouble() ?? 0.0,
    );
  }
}
