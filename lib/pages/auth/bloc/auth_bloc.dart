
import 'package:bloc/bloc.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:expense_manager/network/repos/services/auth_service.dart';
import 'package:expense_manager/network/repos/services/user_service.dart';
import 'package:expense_manager/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../db/local_db.dart';
import '../../../db/model/user_data.dart';
import '../../../network/api_client.dart';
import '../../../utils/globals.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthInitial()) {
    on<CheckIfLoginOrSignIn>(onCheckIfLoginOrSignIn);
    on<CreateAccount>(onCreateAccount);
    on<CreateUser>(onCreateUser);
    on<LoginEvent>(onLogin);
    on<ForgotPassword>(onForgotPassword);
    on<SetGlobalData>(onSetGlobalData);
  }

  void onSetGlobalData(SetGlobalData event, Emitter emit) async{
    emit(AuthLoading());

    UserService service = UserService(apiClient: ApiClient().init());
    var response = await service.getUser();
    var userJson = response["data"]["user"];
    var user = UserData.fromJson(userJson);
    await LocalDB.save(LocalDBKeys.name, user.firstName);
    await LocalDB.save(LocalDBKeys.photo, user.picture??commonAvatar);
    Globals.name = user.firstName;
    Globals.photo = user.picture??commonAvatar;

    emit(GlobalDataSetSuccess());
  }

  void onCheckIfLoginOrSignIn(CheckIfLoginOrSignIn event, Emitter emit) async {
    emit(AuthLoading());
    await LocalDB.saveBool(LocalDBKeys.isFirstLaunch, false);
    try{

      AuthService service = AuthService(apiClient: ApiClient().init());
      var response = await service.checkIfLoginOrSignIn(email: event.email);
      var type = response["data"]["payload"]["type"];
      emit(AuthType(isLogin: type=="SIGN IN"));

    }on FirebaseAuthException catch(e){
      String message = getErrorMessage(e.code, param: "Email address");
      emit(AuthFailure(message: message));
    }
  }

  void onCreateUser(CreateUser event, Emitter emit) async {
    emit(InitLoading());
    try{
      UserService service = UserService(apiClient: ApiClient().init());
      await service.createUser(
        email: event.email, 
        mobileNumber: event.mobileNumber,
        fName: event.firstName,
        lName: event.lastName,
        locale: "ta",
        defaultCurrency: "INR"
      );
      
      await LocalDB.saveBool(LocalDBKeys.isFirstLaunch, false);
      emit(AuthSuccess());
    }on FirebaseAuthException catch(e){
      String message = getErrorMessage(e.code);
      emit(AuthFailure(message: message));
    }
  }

  void onLogin(LoginEvent event, Emitter emit) async {
    emit(AuthLoading());
    try{

      AuthService service = AuthService(apiClient: ApiClient().init());
      await service.signinWithEmail(email: event.email, password: event.password);
      
      await LocalDB.saveBool(LocalDBKeys.isFirstLaunch, false);
      emit(AuthSuccess());
    }on FirebaseAuthException catch(e){
      String message = getErrorMessage(e.code, param: event.email.trim().isEmpty ? "Email address" : "Password");
      emit(AuthFailure(message: message));
    }
  }

  void onCreateAccount(CreateAccount event, Emitter emit) async {
    emit(AuthLoading());
    if(event.password != event.confirmPassword){
      emit(AuthFailure(message: getErrorMessage('mismatch')));
      return;
    }
    try{
      AuthService service = AuthService(apiClient: ApiClient().init());
      await service.signupWithEmail(email: event.email, password: event.password);
      
      await LocalDB.saveBool(LocalDBKeys.isFirstLaunch, false);
      emit(AuthSuccess());
    }on FirebaseAuthException catch(e){
      String message = getErrorMessage(e.code, param: event.email.trim().isEmpty ? "Email address" : "Password");
      emit(AuthFailure(message: message));
    }
  }

  void onForgotPassword(ForgotPassword event, Emitter emit) async{
    emit(AuthLoading());
    try{
      AuthService service = AuthService(apiClient: ApiClient().init());
      await service.forgotPassword(email: event.email);
      emit(ResetLinkSent());
    }on FirebaseException catch(e){
      emit(ResetLinkFailure(message: getErrorMessage(e.code)));
    }
  }

  String getErrorMessage(String errorCode, {String? param}){
    switch(errorCode){
      case "mismatch": return "password & confirm password does not match";
      case "unknown": return "$param is empty!";
      case "user-not-found": return "Sorry buddy, The email address not found";
      case "invalid-email": return "Please enter the valid email address";
      case "email-already-in-use": return "The given email address is already registered.";
      case "wrong-password": return "Wrong password";
      case "account-exists-with-different-credential": return "Email already associated with another account";
      case "weak-password": return "Password is too easy. Password should contain minimum 8 letters";
      case "operation-not-allowed": case "user-disabled": return "Something went wrong try different email address";
      default: return "Sorry buddy, Something went wrong. Try again later!";
    }
  }
}
