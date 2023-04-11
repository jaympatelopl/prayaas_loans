import 'package:prayaas_loans/services/common/app_init.dart';
import 'package:prayaas_loans/services/common/tg_log.dart';
import 'package:prayaas_loans/services/util/tg_flavor.dart';

abstract class Startup {
  static void init() {
    _initFlavor();
    _init();
  }

  static Future<void> _init() async {
    TGLog.d("_init: Start");
    await Future.delayed(const Duration(seconds: 2));
    await initService();
    TGLog.d("_init: End");
  }

  static Future<void> _initFlavor() async {
    TGFlavor.init("assets/config/flavors.json");
  }
}
