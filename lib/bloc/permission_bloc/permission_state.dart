part of 'permission_bloc.dart';

@immutable
abstract class PermissionState {}

class PermissionInitial extends PermissionState {}

class ContactPermissionAccepted extends PermissionState {}

class ContactPermissionDenied extends PermissionState {}

class PermissionChecking extends PermissionState {}