part of 'table_cubit.dart';

sealed class TableState {}

final class TableInitial extends TableState {}

final class TableLoading extends TableState {}

final class TableLoaded extends TableState {}
