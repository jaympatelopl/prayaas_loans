import 'package:get/get.dart';
import 'package:prayaas_loans/view/auth/login/login_controller.dart';
import 'package:prayaas_loans/view/auth/splash/splash_controller.dart';
import 'package:prayaas_loans/view/dashboard/adhar_verifaction/adhar_verifaction_controller.dart';
import 'package:prayaas_loans/view/dashboard/dashboard/dashboard_controller.dart';
import 'package:prayaas_loans/view/dashboard/setting/setting_logic.dart';

class InitialScreenBindings implements Bindings {
  InitialScreenBindings();

  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(),
    );
    Get.lazyPut(
      () => LoginController(),
    );
    Get.lazyPut(
      () => DashboardController(),
    );
    Get.lazyPut(
      () => AadharVerifactionController(),
    );
    Get.lazyPut(
      () => SettingController(),
    );
  }
}
