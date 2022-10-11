part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CheckIfLoginOrSignIn extends AuthEvent {
  final String email;
  CheckIfLoginOrSignIn({
    required this.email
  });
}

class SetGlobalData extends AuthEvent {}

class ForgotPassword extends AuthEvent {
  final String email;
  ForgotPassword({required this.email});
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class CreateAccount extends AuthEvent {
  final String email;
  final String password;
  final String confirmPassword;

  CreateAccount({
    required this.email,
    required this.password,
    required this.confirmPassword});
}

class CreateUser extends AuthEvent {
  final String email;
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final Currency? defaultCurrency;
  final Map<String,String>? locale;

  CreateUser({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.locale,
    required this.mobileNumber,
    required this.defaultCurrency
  });
}