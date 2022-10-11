import 'package:dio/dio.dart';

class UserService{

  Dio apiClient;
  UserService({required this.apiClient});

  Future<dynamic> createUser({
      required String email,
      required String mobileNumber,
      required String fName,
      required String lName,
      required String locale,
      required String defaultCurrency
  })async{

    var data = {
      "first_name" : fName,
      "last_name" : lName,
      "locale" : locale,
      "mobile_number" : mobileNumber,
      "email" : email,
      "default_currency" : defaultCurrency
    };
    Response response = await apiClient.post('/user',data: data);
    return response.data;
  }

  Future<dynamic> getUser()async{
    Response response = await apiClient.get('/user');
    return response.data;
  }
}