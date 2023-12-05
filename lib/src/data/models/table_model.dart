import 'package:comanda_top/src/domain/entities/table_entity.dart';

final class TableModel extends TableEntity {
  TableModel({required super.id, required super.nome, required super.status});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'status': status,
    };
  }

  factory TableModel.fromMap(Map<String, dynamic> map) {
    return TableModel(id: map['id'], nome: map['nome'], status: map['status']);
  }
}
