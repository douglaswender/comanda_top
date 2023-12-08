import 'package:comanda_top/src/domain/entities/table_entity.dart';

final class TableModel extends TableEntity {
  TableModel({super.id, required super.nome, required super.status});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'status': status,
    };
  }

  factory TableModel.fromMap(Map<String, dynamic> map) {
    return TableModel(id: map['id'], nome: map['nome'], status: map['status']);
  }

  factory TableModel.fromEntity(TableEntity table) {
    return TableModel(id: table.id, nome: table.nome, status: table.status);
  }
}
