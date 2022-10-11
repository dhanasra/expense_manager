part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class InitLoading extends AuthState {}

class InitSuccess extends AuthState {}

class ResetLinkSent extends AuthState {}

class GlobalDataSetSuccess extends AuthState {}

class ResetLinkFailure extends AuthState {
  final String message;
  ResetLinkFailure({required this.message});
}

class AuthType extends AuthState {
  final bool isLogin;
  final bool isNextOtp;
  AuthType({
    required this.isLogin,
    this.isNextOtp = false
  });
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure({required this.message});
}

