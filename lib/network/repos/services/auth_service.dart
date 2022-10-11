import 'package:dio/dio.dart';
import 'package:expense_manager/pages/auth/bloc/auth_bloc.dart';

class AuthService{

  Dio apiClient;
  AuthService({required this.apiClient});

  Future<dynamic> checkIfLoginOrSignIn({required String email})async{
    var data = {
      "email" : email,
    };
    Response response = await apiClient.post('/auth/check/',data: data);
    return response.data;
  }

  Future<dynamic> forgotPassword({required String email})async{
    var data = {
      "email" : email
    };
    Response response = await apiClient.post('/auth/forgot-password/',data: data);
    return response.data;
  }

  Future<dynamic> signupWithEmail({required String email, required String password})async{
    var data = {
      "email" : email,
      "password" : password
    };
    Response response = await apiClient.post('/auth/register/',data: data);
    return response.data;
  }

  Future<dynamic> signinWithEmail({required String email, required String password})async{
    var data = {
      "email" : email,
      "password" : password
    };
    Response response = await apiClient.post('/auth/login/',data: data);
    return response.data;
  }

  Future<dynamic> getAccessToken({required String refreshToken}) async{
    var data = {
      "refresh_token" : refreshToken
    };
    Response response = await apiClient.post('/auth/access-token',data: data);
    return response.data;
  }
}