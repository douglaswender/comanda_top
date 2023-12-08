import 'package:brasil_fields/brasil_fields.dart';
import 'package:comanda_top/src/domain/entities/product_entity.dart';
import 'package:comanda_top/src/presentation/menu/cubit/menu_cubit.dart';
import 'package:comanda_top/src/shared/formatter_helper.dart';
import 'package:comanda_top/src/shared/widgets/app_button_widget.dart';
import 'package:comanda_top/src/shared/widgets/app_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final cubit = MenuCubit();

  @override
  void initState() {
    super.initState();
    cubit.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            showDragHandle: true,
            builder: (context) {
              TextEditingController nomeController = TextEditingController();
              TextEditingController precoController = TextEditingController();
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    8.0, 0, 8, MediaQuery.of(context).viewInsets.bottom + 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Nome da mesa:'),
                    AppTextFormField(
                      controller: nomeController,
                    ),
                    const Text('Status:'),
                    AppTextFormField(
                      controller: precoController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CentavosInputFormatter(casasDecimais: 2, moeda: true),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlocBuilder<MenuCubit, MenuState>(
                      bloc: cubit,
                      builder: (context, state) {
                        return AppButton(
                          label: 'Salvar',
                          loading: state is MenuLoading,
                          onPressed: () {
                            cubit.saveProduct(
                                productEntity: ProductEntity(
                              nome: nomeController.text,
                              preco: FormatterHelper.converterParaDouble(
                                  precoController.text),
                            ));
                            Navigator.pop(context);
                            cubit.getAllProducts();
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<MenuCubit, MenuState>(
        bloc: cubit,
        buildWhen: (previous, current) => current is! MenuLoading,
        builder: (context, state) {
          if (state is MenuPageLoading) {
            return const CircularProgressIndicator();
          } else if (state is MenuLoadedProducts) {
            if (state.products.isEmpty) {
              return const Center(
                child: Text('Não há produtos cadastrados'),
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
                  children: state.products //TODO: trocar componente
                      .map((e) => AppButton(
                          onPressed: () {
                            //Modular.to.pushNamed('/table/${e.id}');
                          },
                          label:
                              '${e.nome}\n\n${FormatterHelper.formatarValor(e.preco)}\n\n${e.id}'))
                      .toList(),
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Houve um erro ao procurar os PRODUTOS'),
            );
          }
        },
      ),
    );
  }
}
