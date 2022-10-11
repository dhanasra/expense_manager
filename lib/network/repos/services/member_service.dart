import 'package:dio/dio.dart';

class MemberService {

  Dio apiClient;

  MemberService({required this.apiClient});

  Future<dynamic> addMember({required cashbookId,required mobileNumber,required role})async{
    Response response = await apiClient.post(
        '/member/CB/$cashbookId',
        data: {
          "mobile_number" : mobileNumber,
          "role" : role
        });
    return response.data;
  }

  Future<dynamic> getCashbookList()async{
    Response response = await apiClient.get('/cashbook');
    return response.data;
  }

  Future<dynamic> renameCashbook({required String cashbookName, required String cashbookId})async{
    Response response = await apiClient.put(
        '/cashbook/$cashbookId',
        data: {
          "name" : cashbookName,
        });
    return response.data;
  }

  Future<dynamic> deleteCashbook({required String cashbookId})async{
    Response response = await apiClient.delete('/cashbook/$cashbookId');
    return response.data;
  }


}