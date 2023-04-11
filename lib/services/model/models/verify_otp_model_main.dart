// import '../requestmodel/get_otp_request.dart';
//
// class VerifyOtpMain {
//   VerifyOtpMainObj? data;
//   String? message;
//   String? serverRequestId;
//   int? status;
//
//   VerifyOtpMain({this.data, this.message, this.serverRequestId, this.status});
//
//   VerifyOtpMain.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = VerifyOtpMainObj.fromJson(json['data']);
//     }
//     message = json['message'];
//     serverRequestId = json['serverRequestId'];
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     data['serverRequestId'] = this.serverRequestId;
//     data['status'] = this.status;
//     return data;
//   }
// }
//
// class VerifyOtpMainObj {
//   String? accessToken;
//   String? refreshToken;
//   String? loginDeviceId;
//   String? scope;
//   String? browser;
//   List<String>? roles;
//   String? userIp;
//   String? tokenType;
//   String? userRefId;
//   String? expiresIn;
//   String? loginSource;
//   CredBlock? credBlock;
//
//   VerifyOtpMainObj(
//       {this.accessToken,
//       this.refreshToken,
//       this.loginDeviceId,
//       this.scope,
//       this.browser,
//       this.roles,
//       this.userIp,
//       this.tokenType,
//       this.userRefId,
//       this.expiresIn,
//       this.loginSource,
//       this.credBlock});
//
//   VerifyOtpMainObj.fromJson(Map<String, dynamic> json) {
//     accessToken = json['access_token'];
//     refreshToken = json['refresh_token'];
//     loginDeviceId = json['loginDeviceId'];
//     scope = json['scope'];
//     browser = json['browser'];
//     if (json['roles'] != null) {
//       roles = <String>[];
//       json['roles'].forEach((v) {
//         roles!.add(v);
//       });
//     }
//     userIp = json['userIp'];
//     tokenType = json['token_type'];
//     userRefId = json['userRefId'];
//     expiresIn = json['expires_in'];
//     loginSource = json['loginSource'];
//     credBlock = json['credBlock'] != null ? CredBlock.fromJson(json['credBlock']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['access_token'] = accessToken;
//     data['refresh_token'] = refreshToken;
//     data['loginDeviceId'] = loginDeviceId;
//     data['scope'] = scope;
//     data['browser'] = browser;
//     if (roles != null) {
//       data['roles'] = roles!.map((v) => v).toList();
//     }
//     data['userIp'] = userIp;
//     data['token_type'] = tokenType;
//     data['userRefId'] = userRefId;
//     data['expires_in'] = expiresIn;
//     data['loginSource'] = loginSource;
//     data['credBlock'] = credBlock;
//     return data;
//   }
// }
