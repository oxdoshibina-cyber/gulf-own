import 'package:gulfownsalesview/core/build_config/app_env.dart';
import 'package:gulfownsalesview/data/shared_pref_helper/shared_pref_helper.dart';

class BuildConfig {
  static late final AppEnv environment;
  static late final String baseUrl;
  static String? userToken;
  static String? appToken;
  static late final Duration timeOut;
  static late final bool isDeveloperWindowEnabled;

  static Future<void> initialize({
    required AppEnv environment,
    required String baseUrl,
    Duration timeOut = const Duration(seconds: 15),
    required bool isDeveloperWindowEnabled,
  }) async {
    BuildConfig.environment = environment;
    BuildConfig.baseUrl = baseUrl;
    BuildConfig.timeOut = timeOut;
    BuildConfig.isDeveloperWindowEnabled = isDeveloperWindowEnabled;

    await updateAppToken();
    await updateUserToken();
  }

  static Future<void> updateAppToken({String? token}) async {
    if (token != null) {
      BuildConfig.appToken = token;
      await SharedPrefHelper.saveAppToken(token);
    } else {
      final stored = await SharedPrefHelper.getAppToken();
      if (stored != null && stored.isNotEmpty) {
        BuildConfig.appToken = stored;
      }
    }
  }

  static Future<void> updateUserToken({String? token}) async {
    if (token != null) {
      BuildConfig.userToken = token;
      await SharedPrefHelper.saveUserToken(token);
    } else {
      final stored = await SharedPrefHelper.getUserToken();
      if (stored != null && stored.isNotEmpty) {
        BuildConfig.userToken = stored;
      }
    }
  }
}
