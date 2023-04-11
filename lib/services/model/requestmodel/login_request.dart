import 'dart:convert';

import '../../service/request/tg_post_request.dart';
import '../../service/uris.dart';

class LoginRequest extends TGPostRequest {
  String? modelNo;
  String? password;
  String? browserName;
  String? email;
  String? mobileOs;
  String? appVersion;
  String? imeiNo;
  String? osVersion;

  LoginRequest({
    this.modelNo,
    this.password,
    this.browserName,
    this.email,
    this.mobileOs,
    this.appVersion,
    this.imeiNo,
    this.osVersion,
  });

  LoginRequest.fromJson(Map<String, dynamic> json) {
    modelNo = json['modelNo'];
    password = json['password'];
    browserName = json['browserName'];
    email = json['email'];
    mobileOs = json['mobileOs'];
    appVersion = json['appVersion'];
    imeiNo = json['imeiNo'];
    osVersion = json['osVersion'];
  }

  Map<String, dynamic> toJson() => {
        'modelNo': modelNo,
        'password': password,
        'browserName': browserName,
        'email': email,
        'mobileOs': mobileOs,
        'appVersion': appVersion,
        'imeiNo': imeiNo,
        'osVersion': osVersion,
      };

  @override
  String body() {
    return json.encode(toJson());
  }

  @override
  String getUri() {
    return AppURL.login;
  }
}
