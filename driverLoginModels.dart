// To parse this JSON data, do
//
//     final loginmodel = loginmodelFromJson(jsonString);

import 'dart:convert';

Loginmodel loginmodelFromJson(String str) => Loginmodel.fromJson(json.decode(str));

String loginmodelToJson(Loginmodel data) => json.encode(data.toJson());

class Loginmodel {
  int status;
  String message;
  Result result;

  Loginmodel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory Loginmodel.fromJson(Map<String, dynamic> json) => Loginmodel(
    status: json["status"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result.toJson(),
  };
}

class Result {
  String message;
  String token;
  String userId;
  String email;
  String image;
  String status;
  String loginType;

  Result({
    required this.message,
    required this.token,
    required this.userId,
    required this.email,
    required this.image,
    required this.status,
    required this.loginType,
  });

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
