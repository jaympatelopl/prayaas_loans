import 'package:prayaas_loans/res/constant/navigation_constant.dart';
import 'package:prayaas_loans/services/model/models/navigation.dart';
import 'package:prayaas_loans/view/auth/login/login_binding.dart';
import 'package:prayaas_loans/view/auth/login/login_view.dart';
import 'package:prayaas_loans/view/auth/splash/splash_binding.dart';
import 'package:prayaas_loans/view/auth/splash/splash_view.dart';
import 'package:prayaas_loans/view/auth/welcome/welcome_binding.dart';
import 'package:prayaas_loans/view/auth/welcome/welcome_view.dart';
import 'package:prayaas_loans/view/dashboard/adhar_verifaction/adhar_verifaction_binding.dart';
import 'package:prayaas_loans/view/dashboard/adhar_verifaction/adhar_verifaction_view.dart';
import 'package:prayaas_loans/view/dashboard/dashboard/dashboard_binding.dart';
import 'package:prayaas_loans/view/dashboard/dashboard/dashboard_view.dart';
import 'package:prayaas_loans/view/dashboard/otp_verification/otp_verification_binding.dart';
import 'package:prayaas_loans/view/dashboard/otp_verification/otp_verification_view.dart';
import 'package:prayaas_loans/view/dashboard/setting/setting_binding.dart';
import 'package:prayaas_loans/view/dashboard/setting/setting_view.dart';

abstract class NavigationConfig {
  NavigationConfig._();

  static NavigationModel get initialRoute => splash;

  static final NavigationModel login = NavigationModel(
    route: NavigationConstant.loginScreenRoute,
    screen: const LoginPage(),
    bindings: LoginBinding(),
  );
  static final NavigationModel splash = NavigationModel(
    route: NavigationConstant.splashScreenRoute,
    screen: const SplashPage(),
    bindings: SplashBinding(),
  );
  static final NavigationModel dashboard = NavigationModel(
    route: NavigationConstant.dashboardScreenRoute,
    screen: const DashboardPage(),
    bindings: DashboardBinding(),
  );
  static final NavigationModel aadharVerification = NavigationModel(
    route: NavigationConstant.aadharVerifactionScreenRoute,
    screen: const AadharVerifactionPage(),
    bindings: AadharVerifactionBinding(),
  );
  static final NavigationModel setting = NavigationModel(
    route: NavigationConstant.settingScreenRoute,
    screen: const SettingPage(),
    bindings: SettingBinding(),
  );
  static final NavigationModel otpVerification = NavigationModel(
    route: NavigationConstant.otpVerificationScreenRoute,
    screen: const OtpVerificationPage(),
    bindings: OtpVerificationBinding(),
  );
  static final NavigationModel welcomeScreen = NavigationModel(
    route: NavigationConstant.welcomeScreenScreenRoute,
    screen: const WelcomePage(),
    bindings: WelcomeBinding(),
  );

  static final List<NavigationModel> availableNavigation = [
    login,
    splash,
    dashboard,
    aadharVerification,
    setting,
    otpVerification,
    welcomeScreen,
  ];
}
