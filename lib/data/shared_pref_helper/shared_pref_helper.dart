import 'package:gulfownsalesview/core/constants/pref_resources.dart';
import 'package:gulfownsalesview/util/app_storage.dart';

class SharedPrefHelper {
  static Future<void> saveBaseUrl(String url) async {
    await AppStorage.setString(PrefResources.BASEURL, url);
  }

  static Future<String?> getBaseUrl() async {
    return AppStorage.getString(PrefResources.BASEURL);
  }

  static Future<void> saveAppToken(String token) async {
    await AppStorage.setString(PrefResources.TOKENAPP, token);
  }

  static Future<String?> getAppToken() async {
    return AppStorage.getString(PrefResources.TOKENAPP);
  }

  static Future<void> saveUserToken(String token) async {
    await AppStorage.setString(PrefResources.TOKENUSER, token);
  }

  static Future<String?> getUserToken() async {
    return AppStorage.getString(PrefResources.TOKENUSER);
  }

  static Future<void> clearAppToken() async {
    await AppStorage.remove(PrefResources.TOKENAPP);
  }

  static Future<void> clearUserToken() async {
    await AppStorage.remove(PrefResources.TOKENUSER);
  }

  static Future<void> clearTokens() async {
    await AppStorage.remove(PrefResources.TOKENAPP);
    await AppStorage.remove(PrefResources.TOKENUSER);
  }

  static Future<void> clearAll() async {
    await AppStorage.clearAll();
  }
}
