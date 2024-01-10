// To parse this JSON data, do
//
//     final licenseClass = licenseClassFromJson(jsonString);

import 'dart:convert';

LicenseClass licenseClassFromJson(String str) => LicenseClass.fromJson(json.decode(str));

String licenseClassToJson(LicenseClass data) => json.encode(data.toJson());

class LicenseClass {
  LicenseClass({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  List<Result>? result;

  factory LicenseClass.fromJson(Map<String, dynamic> json) => LicenseClass(
    status: json["status"],
    message: json["message"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.statusText,
    this.licenseClassName,
    this.licenseClassValue,
    this.status,
    this.createdOn,
    this.createdBy,
    this.id,
  });

  String? statusText;
  String? licenseClassName;
  int? licenseClassValue;
  int? status;
  double? createdOn;
  String? createdBy;
  String? id;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    statusText: json["statusText"],
    licenseClassName: json["licenseClassName"],
    licenseClassValue: json["licenseClassValue"],
    status: json["status"],
    createdOn: json["createdOn"]?.toDouble(),
    createdBy: json["createdBy"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "statusText": statusText,
    "licenseClassName": licenseClassName,
    "licenseClassValue": licenseClassValue,
    "status": status,
    "createdOn": createdOn,
    "createdBy": createdBy,
    "id": id,
  };
}
