import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  final String mesaId;

  const TablePage({super.key, required this.mesaId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mesa $mesaId'),
      ),
      body: Center(
        child: Text('Lista de Pedidos da Mesa $mesaId'),
      ),
    );
  }
}
