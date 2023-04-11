import 'dart:convert';

import '../../service/request/tg_post_request.dart';
import '../../service/uris.dart';

class GetOTPRequest extends TGPostRequest {
  String? browserName;
  String? email;
  String? mobile;

  GetOTPRequest({
    this.browserName,
    this.email,
    this.mobile,
  });

  GetOTPRequest.fromJson(Map<String, dynamic> json) {
    browserName = json['browserName'];
    email = json['email'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() => {'browserName': browserName, 'email': email, 'mobile': mobile};

  @override
  String body() {
    return json.encode(toJson());
  }

  @override
  String getUri() {
    return AppURL.getOTP;
  }
}
