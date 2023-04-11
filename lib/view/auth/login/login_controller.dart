import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prayaas_loans/res/common_method.dart';
import 'package:prayaas_loans/res/constant/preference_constant.dart';
import 'package:prayaas_loans/res/constant/string_constant.dart';
import 'package:prayaas_loans/services/common/app_functions.dart';
import 'package:prayaas_loans/services/common/tg_log.dart';
import 'package:prayaas_loans/services/model/models/get_otp_response_model.dart';
import 'package:prayaas_loans/services/model/models/login_response_model.dart';
import 'package:prayaas_loans/services/model/requestmodel/get_otp_request.dart';
import 'package:prayaas_loans/services/model/requestmodel/login_request.dart';
import 'package:prayaas_loans/services/model/responsemodel/get_otp_response.dart';
import 'package:prayaas_loans/services/model/responsemodel/login_response.dart';
import 'package:prayaas_loans/services/service/request/tg_post_request.dart';
import 'package:prayaas_loans/services/service/response/tg_response.dart';
import 'package:prayaas_loans/services/service/service_managers.dart';
import 'package:prayaas_loans/services/singleton/tg_shared_preferences.dart';
import 'package:prayaas_loans/services/util/erros_handle_util.dart';
import 'package:prayaas_loans/services/util/tg_util.dart';
import 'package:prayaas_loans/view/dashboard/dashboard/dashboard_view.dart';
import 'package:prayaas_loans/view/dashboard/otp_verification/otp_verification_binding.dart';
import 'package:prayaas_loans/view/dashboard/otp_verification/otp_verification_view.dart';

import '../../../res/crypto_js.dart';

class LoginController extends GetxController {
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isRememberSwitchOn = true.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isShowLoader = false.obs;
  RxBool isShowPasswordField = false.obs;

  @override
  void onInit() {
    TGLog.d("On Tap----");
    userIdController.addListener(() {
      if (CommonMethod.isValidEmail(userIdController.text)) {
        isShowPasswordField.value = true;
      } else {
        isShowPasswordField.value = false;
      }
    });
    super.onInit();
  }

  // For remember me switch
  void onSwitchTap() {
    isRememberSwitchOn.value = !isRememberSwitchOn.value;
  }

  // For Login
  void onPressLoginButton() {
    Get.to(() => const OtpVerificationPage(), binding: OtpVerificationBinding(), arguments: {
      AppString.mobile: userIdController.text,
      AppString.screenName: AppString.loginScreen,
    });
    return;
    if (!CommonMethod.isPhone(userIdController.text) && !CommonMethod.isValidEmail(userIdController.text)) {
      passwordController.text = '';
      isShowPasswordField.value = false;
      CommonMethod.showSnackBarError(AppString.validEmailMobile);
      return;
    } else if (userIdController.text.length != 10 && CommonMethod.isPhone(userIdController.text)) {
      CommonMethod.showSnackBarError(AppString.validMobile);
      return;
    } else if (passwordController.text.isEmpty && !CommonMethod.isPhone(userIdController.text)) {
      CommonMethod.showSnackBarError(AppString.validPassword);
      return;
    }
    if (CommonMethod.isPhone(userIdController.text)) {
      _loginRequestWithMobile();
    } else {
      _loginRequestWithEmail();
    }
  }

  // Password value change
  void onPasswordChange(String str) {
    passwordController.text = '';
  }

  // For password text visibility
  void onPressEyeIcon() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Login with email and password
  Future<void> _loginRequestWithEmail() async {
    isShowLoader.value = true;
    LoginRequest loginRequest = LoginRequest(
      modelNo: "V2207",
      email: encryptAESCryptoJS(userIdController.text),
      mobileOs: "Android",
      appVersion: "3.1",
      password: passwordController.text.isNotEmpty ? encryptAESCryptoJS(passwordController.text) : null,
      browserName: AppString.browserName,
      imeiNo: "5894f0d3-113d-42e9-9f23-e3850154bad4",
      osVersion: "12",
    );
    var jsonRequest = jsonEncode(loginRequest.toJson());
    TGLog.d("Login Request $jsonRequest");
    TGPostRequest tgPostRequest = loginRequest;
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
      TGSharedPreferences.getInstance().set(PreferenceConstant.mobileNumber, userIdController.text);
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

  // Login with mobile number
  Future<void> _loginRequestWithMobile() async {
    isShowLoader.value = true;
    GetOTPRequest getOTPRequest = GetOTPRequest(
      email: userIdController.text,
      mobile: userIdController.text,
      browserName: AppString.browserName,
    );
    var jsonRequest = jsonEncode(getOTPRequest.toJson());
    TGLog.d("Login Request $jsonRequest");
    TGPostRequest tgPostRequest = getOTPRequest;
    ServiceManager.getInstance().loginRequestWithMobile(
      request: tgPostRequest,
      onSuccess: (response) => _onSuccessLoginWithMobile(response),
      onError: (error) => _onErrorLoginWithMobile(error),
    );
  }

  void _onSuccessLoginWithMobile(GetOTPResponse getOTPResponse) async {
    final GetOtpModel getOtpResponse = getOTPResponse.getLoginResponseObj();
    if (getOtpResponse.status == 200) {
      Get.to(() => const OtpVerificationPage(), binding: OtpVerificationBinding(), arguments: {
        AppString.mobile: userIdController.text,
        AppString.screenName: AppString.loginScreen,
      });
      CommonMethod.showSnackBarSuccess('Get OTP API success');
    } else if (getOtpResponse.status == 401 || getOtpResponse.status == 400) {
      CommonMethod.showSnackBarError(getOtpResponse.message ?? '');
    } else if (getOtpResponse.message != null ? getOtpResponse.message!.isNotEmpty : false) {
      CommonMethod.showSnackBarError(getOtpResponse.message ?? '');
    } else {
      CommonMethod.showSnackBarError(AppString.somethingWrong);
    }
    isShowLoader.value = false;
  }

  void _onErrorLoginWithMobile(TGResponse errorResponse) {
    TGLog.d("LoginResponse : onError()--${errorResponse.body}");
    isShowLoader.value = false;
    if (errorResponse.body!.isNotEmpty) {
      final GetOtpModel loginResponse = GetOtpModel.fromJson(jsonDecode(errorResponse.body ?? ""));
      handleServiceFailError(Get.context!, errorResponse?.error);
      CommonMethod.showSnackBarError(loginResponse.message ?? '');
    } else {
      CommonMethod.showSnackBarError(AppString.somethingWrong);
    }
  }
}
