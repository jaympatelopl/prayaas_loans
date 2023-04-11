import 'dart:convert';

import '../../service/request/tg_post_request.dart';
import '../../service/uris.dart';

class VerifyOTPRequest extends TGPostRequest {
  String? browserName;
  String? otp;
  String? mobile;

  VerifyOTPRequest({
    this.browserName,
    this.otp,
    this.mobile,
  });

  VerifyOTPRequest.fromJson(Map<String, dynamic> json) {
    browserName = json['browserName'];
    otp = json['otp'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() => {'browserName': browserName, 'otp': otp, 'mobile': mobile};

  @override
  String body() {
    return json.encode(toJson());
  }

  @override
  String getUri() {
    return AppURL.login;
  }
}
