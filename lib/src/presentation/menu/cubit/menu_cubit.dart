import 'package:bloc/bloc.dart';
import 'package:comanda_top/src/domain/entities/product_entity.dart';
import 'package:comanda_top/src/domain/usecases/get_products_usecase.dart';
import 'package:comanda_top/src/domain/usecases/save_product_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final SaveProductUsecase _saveProductUsecase = Modular.get();
  final GetProductsUsecase _getProductsUsecase = Modular.get();
  MenuCubit() : super(MenuInitial());

  void saveProduct({required ProductEntity productEntity}) async {
    emit(MenuLoading());
    final response = await _saveProductUsecase(productEntity: productEntity);

    response.fold((l) => emit(MenuInitial()), (r) => emit(MenuSavedProduct()));
  }

  Future<void> getAllProducts() async {
    emit(MenuPageLoading());
    final response = await _getProductsUsecase();

    response.fold((l) => emit(MenuInitial()),
        (r) => emit(MenuLoadedProducts(products: r)));
  }
}
