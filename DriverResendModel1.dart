// To parse this JSON data, do
//
//     final driverResendModel1 = driverResendModel1FromJson(jsonString);

import 'dart:convert';

DriverResendModel1 driverResendModel1FromJson(String str) => DriverResendModel1.fromJson(json.decode(str));

String driverResendModel1ToJson(DriverResendModel1 data) => json.encode(data.toJson());

class DriverResendModel1 {
  int status;
  String message;
  Result result;

  DriverResendModel1({
    required this.status,
    required this.message,
    required this.result,
  });

  factory DriverResendModel1.fromJson(Map<String, dynamic> json) => DriverResendModel1(
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
  String otp;
  String email;
  String message;

  Result({
    required this.otp,
    required this.email,
    required this.message,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    otp: json["otp"],
    email: json["email"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
    "email": email,
    "message": message,
  };
}
