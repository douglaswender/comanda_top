part of 'menu_cubit.dart';

sealed class MenuState {}

final class MenuInitial extends MenuState {}

final class MenuLoading extends MenuState {}

final class MenuPageLoading extends MenuState {}

final class MenuSavedProduct extends MenuState {}

final class MenuLoadedProducts extends MenuState {
  final List<ProductEntity> products;

  MenuLoadedProducts({required this.products});
}
