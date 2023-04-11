// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

class LoginResponseModel {
  LoginResponseModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.refreshToken,
    this.scope,
    this.userType,
    this.message,
    this.status,
    this.email,
    this.campaignCode,
    this.loginToken,
    this.applicationId,
    this.isFpUserFillProfile,
    this.isSpUserFillProfile,
    this.isNpUserFillProfile,
    this.userOrgId,
    this.userId,
    this.isEmailVerified,
    this.userRoleId,
    this.isPasswordChanged,
    this.loginCounter,
    this.data,
    this.coAppAllow,
  });

  String? accessToken;
  String? tokenType;
  String? expiresIn;
  String? refreshToken;
  String? scope;
  int? userType;
  String? message;
  int? status;
  String? email;
  List<dynamic>? campaignCode;
  int? loginToken;
  dynamic applicationId;
  bool? isFpUserFillProfile;
  dynamic isSpUserFillProfile;
  dynamic isNpUserFillProfile;
  int? userOrgId;
  int? userId;
  dynamic isEmailVerified;
  int? userRoleId;
  bool? isPasswordChanged;
  dynamic loginCounter;
  dynamic data;
  bool? coAppAllow;

  factory LoginResponseModel.fromRawJson(String str) => LoginResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        refreshToken: json["refresh_token"],
        scope: json["scope"],
        userType: json["userType"],
        message: json["message"],
        status: json["status"],
        email: json["email"],
        campaignCode: json["campaignCode"] != null ? List<dynamic>.from(json["campaignCode"].map((x) => x)) : [],
        loginToken: json["loginToken"],
        applicationId: json["applicationId"],
        isFpUserFillProfile: json["isFpUserFillProfile"],
        isSpUserFillProfile: json["isSpUserFillProfile"],
        isNpUserFillProfile: json["isNpUserFillProfile"],
        userOrgId: json["userOrgId"],
        userId: json["userId"],
        isEmailVerified: json["isEmailVerified"],
        userRoleId: json["userRoleId"],
        isPasswordChanged: json["isPasswordChanged"],
        loginCounter: json["loginCounter"],
        data: json["data"],
        coAppAllow: json["coAppAllow"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
        "scope": scope,
        "userType": userType,
        "message": message,
        "status": status,
        "email": email,
        "campaignCode": List<dynamic>.from(campaignCode != null ? campaignCode!.map((x) => x) : []),
        "loginToken": loginToken,
        "applicationId": applicationId,
        "isFpUserFillProfile": isFpUserFillProfile,
        "isSpUserFillProfile": isSpUserFillProfile,
        "isNpUserFillProfile": isNpUserFillProfile,
        "userOrgId": userOrgId,
        "userId": userId,
        "isEmailVerified": isEmailVerified,
        "userRoleId": userRoleId,
        "isPasswordChanged": isPasswordChanged,
        "loginCounter": loginCounter,
        "data": data,
        "coAppAllow": coAppAllow,
      };
}
