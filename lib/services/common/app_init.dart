import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:prayaas_loans/services/common/tg_log.dart';
import 'package:prayaas_loans/services/service/tg_service.dart';
import 'package:prayaas_loans/services/singleton/tg_session.dart';
import 'package:prayaas_loans/services/singleton/tg_shared_preferences.dart';
import 'package:prayaas_loans/services/util/tg_flavor.dart';

import 'app_functions.dart';
import 'keys.dart';

initTheme(BuildContext context) async {
  bool? flagDarkTheme = await TGSharedPreferences.getInstance().get(KEY_FLAG_DARK_THEME);
  if (flagDarkTheme == null) {
    flagDarkTheme = true;
    TGSharedPreferences.getInstance().set(KEY_FLAG_DARK_THEME, flagDarkTheme);
  }
  TGSession.getInstance().set(KEY_FLAG_DARK_THEME, flagDarkTheme);

  String? textSize = await TGSharedPreferences.getInstance().get(KEY_TEXT_SIZE);
  if (textSize == null) {
    textSize = "R";
    TGSharedPreferences.getInstance().set(KEY_TEXT_SIZE, textSize);
  }
  TGSession.getInstance().set(KEY_TEXT_SIZE, textSize);

  //TGPortalApp.buildTheme(context, flagDarkTheme, textSize);
}

// Future<void> initUser() async {
//   TGLog.d("initUser()");
//   String? userAsJson = await TGSharedPreferences.getInstance().get(KEY_OBJ_USER);
//   userAsJson != null ? TGSession.getInstance().set(KEY_OBJ_USER, UserVO.fromJson(json.decode(userAsJson))) : TGSession.getInstance().remove(KEY_OBJ_USER);
// }

// Future<void> initProfile() async {
//   TGLog.d("initProfile()");
//   String? profileAsJson =
//       await TGSharedPreferences.getInstance().get(KEY_OBJ_PROFILE);
//   profileAsJson != null
//       ? TGSession.getInstance()
//           .set(KEY_OBJ_PROFILE, ProfileVO.fromJson(json.decode(profileAsJson)))
//       : TGSession.getInstance().remove(KEY_OBJ_PROFILE);
// }

Future<void> initService() async {
  TGLog.d("initService()");
  await TGService.init(
      baseUrl: TGFlavor.baseUrl(),
      applyMock: TGFlavor.applyMock(),
      mockMappingsFile: TGFlavor.mockMappingsFile(),
      headers: defaultHeaders(),
      badCertificateCallbackEnabled: false);
  setAccessTokenInRequestHeader();
}

// Future<void> initLocale() async {
//   TGLog.d("initLocale()");
//   String? storedLocaleCode =
//       await TGSharedPreferences.getInstance().get(KEY_APP_LOCALE_CODE);
//   if (storedLocaleCode != null) {
//     Locale? locale = TGLocale.findLocaleByCode(storedLocaleCode);
//     TGPortalApp.setLocale(locale);
//   }
// }

Future<void> initAppVersionInfo() async {
  TGLog.d("initAppVersionInfo()");
  String? projectVersion;
  try {
    // projectVersion = await GetVersion.projectVersion;
  } on PlatformException {
    TGLog.e('Failed to get project version.');
  }
  String version = (projectVersion != null) ? "v" + projectVersion : "";
  TGSession.getInstance().set(KEY_APP_VERSION, version);
}
