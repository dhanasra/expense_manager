import 'package:expense_manager/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDBKeys{
  static const isFirstLaunch = "isFirstLaunch";
  static const name = "name";
  static const photo = "photo";
  static const theme = "theme";
  static const appLang = "app-lang";
  static const accessToken = "access-token";
  static const refreshToken = "refresh-token";
}

class LocalStorage{
  static LocalStorage? _instance;
  LocalStorage._();

  factory LocalStorage() {
    _instance ??= LocalStorage._();
    return _instance!;
  }

  static Future<void> saveAccessToken(String token) async{
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString("access-token", token);
  }

  static Future<void> saveRefreshAccessToken(String token) async{
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString("refresh-token", token);
  }

  static Future<String?> getAccessToken() async{
    var preferences = await SharedPreferences.getInstance();
    var accessToken = preferences.getString("access-token");
    return accessToken;
  }

  static Future<String?> getRefreshToken() async{
    var preferences = await SharedPreferences.getInstance();
    var accessToken = preferences.getString("refresh-token");
    return accessToken;
  }

}

class LocalDB {

  static LocalDB? _instance;
  LocalDB._();

  factory LocalDB() {
    _instance ??= LocalDB._();
    return _instance!;
  }

  static Future<void> saveBool(String key, bool value) async{
    var preferences = await SharedPreferences.getInstance();
    await preferences.setBool(key, value);
  }

  static Future<void> save(String key, String value) async{
    var preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  }

  static Future<dynamic> get(String key)async{
    var preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static Future<dynamic> getBool(String key)async{
    var preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key);
  }

}