import 'package:get/get.dart';
import 'package:prayaas_loans/services/common/tg_log.dart';
import 'package:prayaas_loans/view/auth/login/login_binding.dart';
import 'package:prayaas_loans/view/auth/login/login_view.dart';
import 'package:prayaas_loans/view/auth/welcome/welcome_binding.dart';
import 'package:prayaas_loans/view/auth/welcome/welcome_view.dart';

class SplashController extends GetxController {
  final String name = "Splash";

  @override
  void onReady() {
    TGLog.d("In splash screen------onReday-");
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    TGLog.d("In splash screen-------");
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.off(() => const WelcomePage(), binding: WelcomeBinding());
      // Get.to(() => const LoginPage());
    });
    super.onInit();
  }

  void onPressButton() {
    Get.to(() => const LoginPage(), binding: LoginBinding());
  }
}
