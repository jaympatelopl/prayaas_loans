import '../service/request/tg_request.dart';
import '../singleton/tg_session.dart';
import '../singleton/tg_shared_preferences.dart';
import '../util/tg_flavor.dart';
import '../util/tg_util.dart';
import 'app_constants.dart';

Map<String, String> defaultHeaders() {
  Map<String, String> headers = {};
  headers['Content-Type'] = 'application/json';
  return headers;
}

void setAccessTokenInRequestHeader() async {
  String? accessToken = await Utils.getAccessToken();
  if (accessToken != null && accessToken.isEmpty == false) {
    TGRequest.defaultHeaders!['token'] = accessToken;
  }
}

void saveKeyValue(String key, dynamic value) {
  TGSession.getInstance().set(key, value);
  TGSharedPreferences.getInstance().set(key, value);
}

void removeKey(String key) {
  TGSharedPreferences.getInstance().remove(key);
  TGSession.getInstance().remove(key);
}

bool isProd() {
  return TGFlavor.name() == FLAVOR_PROD;
}
