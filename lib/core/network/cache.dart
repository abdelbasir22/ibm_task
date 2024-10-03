import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static late SharedPreferences sharedPreferences;
  static Future cacheInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> insertToCache(
      {required String key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

  static String getChacheData({required String key}) {
    return sharedPreferences.getString(key) ?? '';
  }

  static Future<bool> deleteCacheItem({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
