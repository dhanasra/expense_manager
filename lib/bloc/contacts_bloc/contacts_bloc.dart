
import 'package:bloc/bloc.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactsInitial()) {
    on<GetContacts>(onGetContacts);
    on<AddContacts>(onContactAdded);

  }

  void onContactAdded(AddContacts event, Emitter emit) async {
    emit(ContactAdded());
  }

  void onGetContacts(GetContacts event, Emitter emit) async {
    emit(ContactsLoading());
    final phonePermissionStatus = await Permission.contacts.status;
    if(!phonePermissionStatus.isGranted){
      await Permission.contacts.request().then((value) async{
        if(value.isGranted){
          List<Contact> contacts = await ContactsService.getContacts();
          emit(ContactsFetched(contacts: contacts));
        }else{
          emit(ContactPermissionDenied());
        }
      });
    }else{
      List<Contact> contacts = await ContactsService.getContacts();
      emit(ContactsFetched(contacts: contacts));
    }
  }
}
