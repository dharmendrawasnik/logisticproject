// To parse this JSON data, do
//
//     final forgatepassotpmodel = forgatepassotpmodelFromJson(jsonString);

import 'dart:convert';

Forgatepassotpmodel forgatepassotpmodelFromJson(String str) => Forgatepassotpmodel.fromJson(json.decode(str));

String forgatepassotpmodelToJson(Forgatepassotpmodel data) => json.encode(data.toJson());

class Forgatepassotpmodel {
  int status;
  String message;
  Result result;

  Forgatepassotpmodel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory Forgatepassotpmodel.fromJson(Map<String, dynamic> json) => Forgatepassotpmodel(
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
  String status;
  String loginType;
  String email;

  Result({
    required this.message,
    required this.token,
    required this.userId,
    required this.status,
    required this.loginType,
    required this.email,
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
