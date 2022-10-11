part of 'cashbook_bloc.dart';

@immutable
abstract class CashbookEvent {}

class CreateCashbook extends CashbookEvent {
  final String name;
  final bool isPrivate;

  CreateCashbook({required this.name, required this.isPrivate});
}

class AddMember extends CashbookEvent {
  final String phone;
  final String role;
  final String cashbookId;

  AddMember({
    required this.phone,
    required this.role,
    required this.cashbookId
  });
}