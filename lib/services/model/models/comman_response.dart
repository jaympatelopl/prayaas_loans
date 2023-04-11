// import 'dart:convert';
//
// import '../requestmodel/get_otp_request.dart';
//
// class CommanResponse {
//   List<String>? roles;
//   String? mobile;
//   String? deviceId;
//   String? loginToken;
//   String? isAuthenticated;
//   String? message;
//   String? token_type;
//   String? orgId;
//   String? access_token;
//   String? refresh_token;
//   String? scope;
//   String? browser;
//   String? userIp;
//   String? userRefId;
//   String? expires_in;
//   String? loginSource;
//   String? status;
//   String? sessionKey;
//   CredBlock? credBlock;
//
//   CommanResponse(
//       {this.roles,
//       this.mobile,
//       this.deviceId,
//       this.loginToken,
//       this.isAuthenticated,
//       this.message,
//       this.token_type,
//       this.orgId,
//       this.access_token,
//       this.refresh_token,
//       this.scope,
//       this.browser,
//       this.userIp,
//       this.userRefId,
//       this.expires_in,
//       this.loginSource,
//       this.status,
//       this.sessionKey,
//       this.credBlock});
//
//   CommanResponse.fromJson(Map<String, dynamic> json) {
//     roles = [];
//     if (json['roles'] != null) {
//       List jsonProjects = json['roles'];
//       jsonProjects.forEach((element) => roles!.add(element));
//     }
//     mobile = json['mobile'];
//     deviceId = json['deviceId'];
//     loginToken = json['loginToken'];
//     isAuthenticated = json['isAuthenticated'];
//     message = json['message'];
//     token_type = json['token_type'];
//     orgId = json['orgId'];
//     access_token = json['access_token'];
//     refresh_token = json['refresh_token'];
//     scope = json['scope'];
//     browser = json['browser'];
//     userIp = json['userIp'];
//     userRefId = json['userRefId'];
//     expires_in = json['expires_in'];
//     loginSource = json['loginSource'];
//     status = json['status'];
//     sessionKey = json['sessionKey'];
//     if (json['credBlock'] != null) {
//       credBlock = CredBlock.fromJson(json['credBlock']);
//     }
//   }
//
//   Map<String, dynamic> toJson() => {
//         'roles': roles,
//         'mobile': mobile,
//         'deviceId': deviceId,
//         'loginToken': loginToken,
//         'isAuthenticated': isAuthenticated,
//         'message': message,
//         'token_type': token_type,
//         'orgId': orgId,
//         'access_token': access_token,
//         'refresh_token': refresh_token,
//         'scope': scope,
//         'browser': browser,
//         'userIp': userIp,
//         'userRefId': userRefId,
//         'expires_in': expires_in,
//         'loginSource': loginSource,
//         'status': status,
//         'sessionKey': sessionKey,
//         'credBlock': credBlock?.toJson()
//       };
// }
