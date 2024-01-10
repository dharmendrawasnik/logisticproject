// To parse this JSON data, do
//
//     final driverResendModel = driverResendModelFromJson(jsonString);

import 'dart:convert';

DriverResendModel driverResendModelFromJson(String str) => DriverResendModel.fromJson(json.decode(str));

String driverResendModelToJson(DriverResendModel data) => json.encode(data.toJson());

class DriverResendModel {
  int? status;
  String? message;
  List<Result>? result;

  DriverResendModel({
    this.status,
    this.message,
    this.result,
  });

  factory DriverResendModel.fromJson(Map<String, dynamic> json) => DriverResendModel(
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
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? email;
  String? password;
  String? licenseNo;
  String? statusText;
  String? image;
  String? vendorId;
  String? otp;
  int? status;
  double? createdOn;
  String? createdBy;
  String? dfcmtoken;

  Result({
    this.firstName,
    this.lastName,
    this.mobileNo,
    this.email,
    this.password,
    this.licenseNo,
    this.statusText,
    this.image,
    this.vendorId,
    this.otp,
    this.status,
    this.createdOn,
    this.createdBy,
    this.dfcmtoken,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    firstName: json["firstName"],
    lastName: json["lastName"],
    mobileNo: json["mobileNo"],
    email: json["email"],
    password: json["password"],
    licenseNo: json["licenseNo"],
    statusText: json["statusText"],
    image: json["image"],
    vendorId: json["vendorId"],
    otp: json["otp"],
    status: json["status"],
    createdOn: json["createdOn"]?.toDouble(),
    createdBy: json["createdBy"],
    dfcmtoken: json["dfcmtoken"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "mobileNo": mobileNo,
    "email": email,
    "password": password,
    "licenseNo": licenseNo,
    "statusText": statusText,
    "image": image,
    "vendorId": vendorId,
    "otp": otp,
    "status": status,
    "createdOn": createdOn,
    "createdBy": createdBy,
    "dfcmtoken": dfcmtoken,
  };
}
