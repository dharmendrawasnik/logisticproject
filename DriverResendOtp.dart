// To parse this JSON data, do
//
//     final driverResendOtp = driverResendOtpFromJson(jsonString);

import 'dart:convert';

DriverResendOtp driverResendOtpFromJson(String str) => DriverResendOtp.fromJson(json.decode(str));

String driverResendOtpToJson(DriverResendOtp data) => json.encode(data.toJson());

class DriverResendOtp {
  DriverResendOtp({
    required this.status,
    required this.message,
    required this.result,
  });

  int status;
  String message;
  Result result;

  factory DriverResendOtp.fromJson(Map<String, dynamic> json) => DriverResendOtp(
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
  Result({
    required this.otp,
    required this.message,
  });

  String otp;
  String message;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    otp: json["otp"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
    "message": message,
  };
}
