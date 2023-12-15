base class OrderEntity {
  final int quantidade;
  final String nome;
  final double subtotal;

  OrderEntity({
    required this.quantidade,
    required this.nome,
    required this.subtotal,
  });
}
