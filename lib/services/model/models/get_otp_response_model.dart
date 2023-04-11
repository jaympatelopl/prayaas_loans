// To parse this JSON data, do
//
//     final getOtpModel = getOtpModelFromJson(jsonString);

import 'dart:convert';

class GetOtpModel {
  GetOtpModel({
    this.id,
    this.message,
    this.status,
    this.data,
    this.flag,
    this.branchList,
    this.listData,
    this.lastAccessBusinessTypeId,
  });

  dynamic id;
  String? message;
  int? status;
  dynamic data;
  dynamic flag;
  dynamic branchList;
  List<dynamic>? listData;
  dynamic lastAccessBusinessTypeId;

  factory GetOtpModel.fromRawJson(String str) => GetOtpModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetOtpModel.fromJson(Map<String, dynamic> json) => GetOtpModel(
        id: json["id"],
        message: json["message"],
        status: json["status"],
        data: json["data"],
        flag: json["flag"],
        branchList: json["branchList"],
        listData: json["listData"] != null ? List<dynamic>.from(json["listData"].map((x) => x)) : [],
        lastAccessBusinessTypeId: json["lastAccessBusinessTypeId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "status": status,
        "data": data,
        "flag": flag,
        "branchList": branchList,
        "listData": listData != null ? List<dynamic>.from(listData!.map((x) => x)) : [],
        "lastAccessBusinessTypeId": lastAccessBusinessTypeId,
      };
}
