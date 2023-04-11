import 'dart:convert';

import 'package:get/get.dart';
import 'package:prayaas_loans/res/common_method.dart';
import 'package:prayaas_loans/res/constant/preference_constant.dart';
import 'package:prayaas_loans/res/constant/string_constant.dart';
import 'package:prayaas_loans/res/crypto_js.dart';
import 'package:prayaas_loans/services/common/app_functions.dart';
import 'package:prayaas_loans/services/common/tg_log.dart';
import 'package:prayaas_loans/services/model/models/login_response_model.dart';
import 'package:prayaas_loans/services/model/requestmodel/verify_otp_request.dart';
import 'package:prayaas_loans/services/model/responsemodel/login_response.dart';
import 'package:prayaas_loans/services/service/request/tg_post_request.dart';
import 'package:prayaas_loans/services/service/response/tg_response.dart';
import 'package:prayaas_loans/services/service/service_managers.dart';
import 'package:prayaas_loans/services/singleton/tg_shared_preferences.dart';
import 'package:prayaas_loans/services/util/erros_handle_util.dart';
import 'package:prayaas_loans/services/util/tg_util.dart';
import 'package:prayaas_loans/view/dashboard/dashboard/dashboard_view.dart';

class OtpVerificationController extends GetxController {
  RxString otp = "".obs;
  RxBool isShowLoader = false.obs;
  String mobileNumber = "";
  String screenName = "";

  @override
  void onInit() {
    mobileNumber = Get.arguments[AppString.mobile];
    screenName = Get.arguments[AppString.screenName];
    super.onInit();
  }

  // On Back from back arrow
  void onBackPress() {
    Get.back();
  }

  void onPressResendOTP() {
    TGLog.d('OTP sent successfully');
  }

  void onPressSubmit() {
    TGLog.d("OTP");
    if (otp.value.length != 6) {
      CommonMethod.showSnackBarError(AppString.validOTP);
      return;
    }
    if (screenName == AppString.loginScreen) {
      _submitOTPForMobileVerification();
    }
  }

  void onOtpChange(int number) {
    if ((otp.value.length == 6 && number != 10) || (number == 10 && otp.value.isEmpty)) {
      TGLog.d("OTP value in max length block ${otp.value}");
      return;
    } else if (number == 10 && otp.value.isNotEmpty) {
      otp.value = otp.value.substring(0, otp.value.length - 1);
      TGLog.d("OTP value in remove value block ${otp.value}");
    } else {
      otp.value = '${otp.value}$number';
      TGLog.d("OTP value --${otp.value}");
    }
  }

  // Login with otp
  Future<void> _submitOTPForMobileVerification() async {
    isShowLoader.value = true;
    VerifyOTPRequest verifyOTPRequest = VerifyOTPRequest(
      browserName: AppString.browserName,
      mobile: encryptAESCryptoJS(mobileNumber),
      otp: otp.value,
    );
    var jsonRequest = jsonEncode(verifyOTPRequest.toJson());
    TGLog.d("Login Request $jsonRequest");
    TGPostRequest tgPostRequest = verifyOTPRequest;
    ServiceManager.getInstance().loginRequest(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessLogin(response),
      onError: (error) => _onErrorLogin(error),
    );
  }

  void _onSuccessLogin(LoginResponse response) async {
    TGLog.d("LoginResponse : onSuccess()");
    final LoginResponseModel loginResponse = response.getLoginResponseObj();
    if (loginResponse.status == 200) {
      Utils.setAccessToken(loginResponse.accessToken);
      TGSharedPreferences.getInstance().set(PreferenceConstant.mobileNumber, mobileNumber);
      setAccessTokenInRequestHeader();
      Get.offAll(() => const DashboardPage());
      CommonMethod.showSnackBarSuccess('Login API success');
    } else if (loginResponse.status == 401 || loginResponse.status == 400) {
      CommonMethod.showSnackBarError(loginResponse.message ?? '');
    } else {
      CommonMethod.showSnackBarError(AppString.somethingWrong);
    }
    isShowLoader.value = false;
  }

  void _onErrorLogin(TGResponse errorResponse) {
    TGLog.d("LoginResponse : onError()--${errorResponse.body}");
    isShowLoader.value = false;
    if (errorResponse.body!.isNotEmpty) {
      final LoginResponseModel loginResponse = LoginResponseModel.fromJson(jsonDecode(errorResponse.body ?? ""));
      handleServiceFailError(Get.context!, errorResponse?.error);
      CommonMethod.showSnackBarError(loginResponse.message ?? '');
    } else {
      CommonMethod.showSnackBarError(AppString.somethingWrong);
    }
  }
}
