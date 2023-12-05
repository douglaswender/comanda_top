part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoadedTables extends HomeState {
  final List<TableEntity> tables;

  HomeLoadedTables({required this.tables});
}

final class HomeFailureTables extends HomeState {}
