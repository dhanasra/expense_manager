import 'package:dio/dio.dart';
import 'package:expense_manager/db/local_db.dart';
import 'package:expense_manager/network/repos/services/auth_service.dart';
import 'package:expense_manager/utils/constants.dart';

class ApiClient {

  Dio init(){
    Dio dio = Dio();
    dio.interceptors.add(ApiInterceptors(dio: dio));
    dio.options.baseUrl = "https://e-m-api.herokuapp.com";
    return dio;
  }

}

class ApiInterceptors extends Interceptor {
  final Dio dio;
  ApiInterceptors({required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{

    final accessToken = await LocalStorage.getAccessToken();
    options.headers["Authorization"] = "Bearer $accessToken";
    options.headers["Content-Type"] = "application/json";

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async{
    if(err.response?.statusCode==401){
      RequestOptions? requestOptions = err.response?.requestOptions;

      var rToken = await LocalStorage.getRefreshToken();

      AuthService service = AuthService(apiClient: dio);
      dynamic result = await service.getAccessToken(refreshToken: rToken!);

      var payload = result["data"]["payload"];

      await LocalStorage.saveAccessToken(payload["access_token"]);
      await LocalStorage.saveRefreshAccessToken(payload["refresh_token"]);

      Options options = Options();
      err.requestOptions.headers["Authorization"] = "Bearer ${payload["access_token"]}";
      err.requestOptions.headers["Content-Type"] = "application/json";

      options.headers = err.requestOptions.headers;
      options.extra = err.requestOptions.extra;
      options.method = err.requestOptions.method;

      Response response = await dio.request(requestOptions!.path,options: options, data: err.requestOptions.data);
      handler.resolve(response);
      return;
    }else {
      return handler.next(err);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async{
    if(response.statusCode==200){
      var data = response.data["data"];

      if(data!=null && data.containsKey("payload")){
         var payload = data["payload"];
         if(payload.containsKey("access_token")){
            await LocalStorage.saveAccessToken(payload["access_token"]);
         }
         if(payload.containsKey("refresh_token")){
           await LocalStorage.saveRefreshAccessToken(payload["refresh_token"]);
         }
      }

      return handler.next(response);
    }

  }

}