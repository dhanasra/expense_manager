part of 'cashbook_bloc.dart';

@immutable
abstract class CashbookState {}

class CashbookInitial extends CashbookState {}

class Loading extends CashbookState {}

class Failure extends CashbookState {
  final String message;
  Failure({required this.message});
}

class CashbookCreated extends CashbookState {
  final Cashbook cashbook;
  CashbookCreated({required this.cashbook});
}

class MemberAdded extends CashbookState {}