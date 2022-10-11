import 'package:dio/dio.dart';

class CashbookService {

  Dio apiClient;

  CashbookService({required this.apiClient});

  Future<dynamic> addCashbook({required cashbookName,required isPrivate})async{
    Response response = await apiClient.post(
        '/cashbook',
        data: {
          "name" : cashbookName,
          "is_private" : isPrivate
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