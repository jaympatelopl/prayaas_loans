import '../common/keys.dart';
import '../singleton/tg_shared_preferences.dart';

class Utils {
  static void setAccessToken(String? value) {
    TGSharedPreferences.getInstance().set(PREF_ACCESS_TOKEN, value);
  }

  static Future<String?> getAccessToken() async {
    return "";
  }
}
