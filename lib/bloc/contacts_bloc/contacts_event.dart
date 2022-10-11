part of 'contacts_bloc.dart';

@immutable
abstract class ContactsEvent {}

class GetContacts extends ContactsEvent {}

class AddContacts extends ContactsEvent {
}