// To parse this JSON data, do
//
//     final otpmodel = otpmodelFromJson(jsonString);

import 'dart:convert';

Otpmodel otpmodelFromJson(String str) => Otpmodel.fromJson(json.decode(str));

String otpmodelToJson(Otpmodel data) => json.encode(data.toJson());

class Otpmodel {
  int? status;
  String? message;
  Result? result;

  Otpmodel({
    this.status,
    this.message,
    this.result,
  });

  factory Otpmodel.fromJson(Map<String, dynamic> json) => Otpmodel(
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
  String? message;
  String? token;
  String? userId;
  String? status;
  String? loginType;
  String? email;

  Result({
    this.message,
    this.token,
    this.userId,
    this.status,
    this.loginType,
    this.email,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    message: json["message"],
    token: json["token"],
    userId: json["userId"],
    status: json["status"],
    loginType: json["LoginType"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "token": token,
    "userId": userId,
    "status": status,
    "LoginType": loginType,
    "email": email,
  };
}
