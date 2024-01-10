// To parse this JSON data, do
//
//     final loginModels = loginModelsFromJson(jsonString);

import 'dart:convert';

LoginModels loginModelsFromJson(String str) => LoginModels.fromJson(json.decode(str));

String loginModelsToJson(LoginModels data) => json.encode(data.toJson());

class LoginModels {
  LoginModels({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  Result? result;

  factory LoginModels.fromJson(Map<String, dynamic> json) => LoginModels(
    status: json["status"],
    message: json["message"],
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result?.toJson(),
  };
}

class Result {
  Result({
    this.message,
    this.token,
    this.userId,
    this.email,
    this.image,
    this.status,
    this.loginType,
  });

  String? message;
  String? token;
  String? userId;
  String? email;
  String? image;
  String? status;
  String? loginType;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    message: json["message"],
    token: json["token"],
    userId: json["userId"],
    email: json["email"],
    image: json["image"],
    status: json["status"],
    loginType: json["LoginType"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "token": token,
    "userId": userId,
    "email": email,
    "image": image,
    "status": status,
    "LoginType": loginType,
  };
}
