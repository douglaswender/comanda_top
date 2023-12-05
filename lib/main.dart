import 'package:comanda_top/app_module.dart';
import 'package:comanda_top/app_widget.dart';
import 'package:comanda_top/src/shared/database_helper_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbHelper = DatabaseHelperImpl();
  await dbHelper.init();
  //dbHelper.insert({'nome': '05'}, 'mesa');
  // runApp(MainApp(
  //   dbHelper: dbHelper,
  // ));
  runApp(ModularApp(
      module: AppModule(databaseHelper: dbHelper), child: const AppWidget()));
}

// class MainApp extends StatefulWidget {
//   final DatabaseHelperImpl dbHelper;
//   const MainApp({super.key, required this.dbHelper});

//   @override
//   State<MainApp> createState() => _MainAppState();
// }

// class _MainAppState extends State<MainApp> {
//   @override
//   void initState() {
//     super.initState();
//     getMesa();
//   }

//   Future getMesa() async {
//     final response = await widget.dbHelper.queryById('mesa', 5);
//     print(response);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World!'),
//         ),
//       ),
//     );
//   }
// }
