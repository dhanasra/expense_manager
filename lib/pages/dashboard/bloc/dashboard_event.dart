part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class GetCashbooks extends DashboardEvent {}

class SearchCashBook extends DashboardEvent {
  final List<Cashbook> cashbooks;
  final String text;
  SearchCashBook({required this.cashbooks, required this.text});
}

class DeleteCashbook extends DashboardEvent {
  final int index;
  final List<Cashbook> cashbooks;
  final String id;
  DeleteCashbook({required this.index, required this.cashbooks, required this.id});
}

class RenameCashbook extends DashboardEvent {
  final List<Cashbook> cashbooks;
  final int index;
  final String id;
  final String name;
  RenameCashbook({required this.index, required this.cashbooks, required this.id, required this.name});
}