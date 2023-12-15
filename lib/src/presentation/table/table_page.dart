import 'package:comanda_top/src/presentation/table/cubit/table_cubit.dart';
import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  final int mesaId;

  const TablePage({super.key, required this.mesaId});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  final cubit = TableCubit();

  @override
  void initState() {
    super.initState();
    cubit.getOrder(mesaId: widget.mesaId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mesa ${widget.mesaId}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //adicionar pedido
//           final dbHelper = Modular.get<DatabaseHelper>();
//           final response = await dbHelper.sqlQuery(sql: '''
// SELECT i.nome AS item_nome, pi.quantidade, pi.subtotal
// FROM pedido_item pi
// JOIN item_menu i ON pi.item_id = i.id
// JOIN pedido p on p.id = pi.pedido_id
// WHERE p.mesa_id = 1''');
//           print(response);
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text('Lista de Pedidos da Mesa ${widget.mesaId}'),
      ),
    );
  }
}
