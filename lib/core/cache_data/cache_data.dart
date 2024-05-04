import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  static late final SharedPreferences sharedPreferences;

  static Future<void> casheInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setData(String key, dynamic value) {
    if (value is String) {
      sharedPreferences.setString(key, value);
    } else if (value is int) {
      sharedPreferences.setInt(key, value);
    } else if (value is double) {
      sharedPreferences.setDouble(key, value);
    } else if (value is bool) {
      sharedPreferences.setBool(key, value);
    } else if (value is List<String>) {
      sharedPreferences.setStringList(key, value);
    }
  }

  static dynamic getData(String key) {
    return sharedPreferences.get(key);
  }

  static Future<void> clearData({required String key}) async {
    await sharedPreferences.remove(key);
  }
}
