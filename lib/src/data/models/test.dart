import 'dart:convert';

class Demo {
  final int id;
  final String nome;
  final String preco;
  Demo({
    required this.id,
    required this.nome,
    required this.preco,
  });

  Demo copyWith({
    int? id,
    String? nome,
    String? preco,
  }) {
    return Demo(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      preco: preco ?? this.preco,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
    };
  }

  factory Demo.fromMap(Map<String, dynamic> map) {
    return Demo(
      id: map['id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      preco: map['preco'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Demo.fromJson(String source) => Demo.fromMap(json.decode(source));

  @override
  String toString() => 'Demo(id: $id, nome: $nome, preco: $preco)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Demo &&
        other.id == id &&
        other.nome == nome &&
        other.preco == preco;
  }

  @override
  int get hashCode => id.hashCode ^ nome.hashCode ^ preco.hashCode;
}
