part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class CashbooksEmpty extends DashboardState {}

class CashbooksLoading extends DashboardState {}

class CashbooksDeleting extends DashboardState {}

class CashbooksRenaming extends DashboardState {}

class CashbooksFetched extends DashboardState {
  final List<Cashbook> cashbooks;
  CashbooksFetched({required this.cashbooks});
}

class BookDeleted extends DashboardState {
  final List<Cashbook> cashbooks;
  BookDeleted({required this.cashbooks});
}

class BookRenamed extends DashboardState {
  final List<Cashbook> cashbooks;
  BookRenamed({required this.cashbooks});
}

class SearchResult extends DashboardState {
  final List<Cashbook> cashbooks;
  SearchResult({required this.cashbooks});
}