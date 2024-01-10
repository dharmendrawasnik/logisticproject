// To parse this JSON data, do
//
//     final registorModels = registorModelsFromJson(jsonString);

import 'dart:convert';

RegistorModels registorModelsFromJson(String str) => RegistorModels.fromJson(json.decode(str));

String registorModelsToJson(RegistorModels data) => json.encode(data.toJson());

class RegistorModels {
  int? status;
  String? message;
  RegistorModelsResult? result;

  RegistorModels({
    this.status,
    this.message,
    this.result,
  });

  factory RegistorModels.fromJson(Map<String, dynamic> json) => RegistorModels(
    status: json["status"],
    message: json["message"],
    result: json["result"] == null ? null : RegistorModelsResult.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result?.toJson(),
  };
}

class RegistorModelsResult {
  String? message;
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? otp;
  String? token;
  Image? image;
  String? userId;
  String? loginType;

  RegistorModelsResult({
    this.message,
    this.firstName,
    this.lastName,
    this.mobileNo,
    this.otp,
    this.token,
    this.image,
    this.userId,
    this.loginType,
  });

  factory RegistorModelsResult.fromJson(Map<String, dynamic> json) => RegistorModelsResult(
    message: json["message"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    mobileNo: json["mobileNo"],
    otp: json["otp"],
    token: json["token"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    userId: json["userId"],
    loginType: json["LoginType"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "firstName": firstName,
    "lastName": lastName,
    "mobileNo": mobileNo,
    "otp": otp,
    "token": token,
    "image": image?.toJson(),
    "userId": userId,
    "LoginType": loginType,
  };
}

class Image {
  int? status;
  String? message;
  List<ResultElement>? result;

  Image({
    this.status,
    this.message,
    this.result,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    status: json["status"],
    message: json["message"],
    result: json["result"] == null ? [] : List<ResultElement>.from(json["result"]!.map((x) => ResultElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class ResultElement {
  String? message;

  ResultElement({
    this.message,
  });

  factory ResultElement.fromJson(Map<String, dynamic> json) => ResultElement(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
