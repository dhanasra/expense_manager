part of 'permission_bloc.dart';

@immutable
abstract class PermissionEvent {}

class CheckContactPermission extends PermissionEvent {}
