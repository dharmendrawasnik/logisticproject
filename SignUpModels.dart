// To parse this JSON data, do
//
//     final signUpModels = signUpModelsFromJson(jsonString);

import 'dart:convert';

SignUpModels signUpModelsFromJson(String str) => SignUpModels.fromJson(json.decode(str));

String signUpModelsToJson(SignUpModels data) => json.encode(data.toJson());

class SignUpModels {
  SignUpModels({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  SignUpModelsResult? result;

  factory SignUpModels.fromJson(Map<String, dynamic> json) => SignUpModels(
    status: json["status"],
    message: json["message"],
    result: json["result"] == null ? null : SignUpModelsResult.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result?.toJson(),
  };
}

class SignUpModelsResult {
  SignUpModelsResult({
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

  String? message;
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? otp;
  String? token;
  Image? image;
  String? userId;
  String? loginType;

  factory SignUpModelsResult.fromJson(Map<String, dynamic> json) => SignUpModelsResult(
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
  Image({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  List<ResultElement>? result;

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
  ResultElement({
    this.message,
  });

  String? message;

  factory ResultElement.fromJson(Map<String, dynamic> json) => ResultElement(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
