import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc() : super(PermissionInitial()) {
    on<CheckContactPermission>(onCheckContactPermission);
  }

  void onCheckContactPermission(CheckContactPermission event, Emitter emit)async{
    emit(PermissionChecking());

    final phonePermissionStatus = await Permission.contacts.status;
    if(!phonePermissionStatus.isGranted){
      await Permission.contacts.request().then((value){
        if(value.isGranted){
          emit(ContactPermissionAccepted());
        }else{
          emit(ContactPermissionDenied());
        }
      });
    }else{
      emit(ContactPermissionAccepted());
    }
  }
}
