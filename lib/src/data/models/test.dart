import 'dart:convert';

import 'package:flutter/widgets.dart';

class Demo {
  final int? quantidade;
  final String nome;
  final double subtotal;
  Demo({
    this.quantidade,
    required this.nome,
    required this.subtotal,
  });

  Demo copyWith({
    ValueGetter<int?>? quantidade,
    String? nome,
    double? subtotal,
  }) {
    return Demo(
      quantidade: quantidade?.call() ?? this.quantidade,
      nome: nome ?? this.nome,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantidade': quantidade,
      'nome': nome,
      'subtotal': subtotal,
    };
  }

  factory Demo.fromMap(Map<String, dynamic> map) {
    return Demo(
      quantidade: map['quantidade']?.toInt(),
      nome: map['nome'] ?? '',
      subtotal: map['subtotal']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Demo.fromJson(String source) => Demo.fromMap(json.decode(source));

  @override
  String toString() =>
      'Demo(quantidade: $quantidade, nome: $nome, subtotal: $subtotal)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Demo &&
        other.quantidade == quantidade &&
        other.nome == nome &&
        other.subtotal == subtotal;
  }

  @override
  int get hashCode => quantidade.hashCode ^ nome.hashCode ^ subtotal.hashCode;
}
