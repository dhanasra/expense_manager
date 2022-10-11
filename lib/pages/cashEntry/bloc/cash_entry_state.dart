part of 'cash_entry_bloc.dart';

@immutable
abstract class CashEntryState {}

class CashEntryInitial extends CashEntryState {}

class Loading extends CashEntryState {}

class Failure extends CashEntryState {
  final String message;
  Failure({required this.message});
}

class CashEntryCreated extends CashEntryState {
  final CashEntry cashEntry;
  CashEntryCreated({required this.cashEntry});
}

