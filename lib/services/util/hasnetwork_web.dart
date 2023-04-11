import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../common/tg_log.dart';

Future<bool> hasNetwork() async {
  bool result = await InternetConnectionCheckerPlus().hasConnection;

  TGLog.d("connection :${result}");

  return result;
}
