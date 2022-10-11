part of 'contacts_bloc.dart';

@immutable
abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactsLoading extends ContactsState {}

class ContactPermissionAccepted extends ContactsState {}

class ContactPermissionDenied extends ContactsState {}

class ContactAdded extends ContactsState {
}

class ContactsFetched extends ContactsState {
  final List<Contact> contacts;
  ContactsFetched({required this.contacts});
}
