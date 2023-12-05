import 'package:comanda_top/src/presentation/home/cubit/home_cubit.dart';
import 'package:comanda_top/src/presentation/widgets/float_action_button/app_float_action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCubit cubit = HomeCubit();

  @override
  void initState() {
    super.initState();
    cubit.getTables();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comanda Top'),
        centerTitle: true,
      ),
      floatingActionButton: AppFloatingActionButton(
        distance: 92,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.table_bar),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.book),
          )
        ],
      ),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoadedTables) {
            if (state.tables.isEmpty) {
              return const Center(
                child: Text('Não há mesas cadastradas'),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.topCenter,
                child: Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: state.tables
                      .map((e) => ElevatedButton(
                          onPressed: () {
                            Modular.to.pushNamed('/table/${e.id}');
                          },
                          child: Text('Mesa ${e.nome}')))
                      .toList(),
                ),
              ),
            );
          } else {
            return const Text('Houve um erro ao tentar recuperar os dados!');
          }
        },
      ),
    );
  }
}
