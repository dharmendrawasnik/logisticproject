// To parse this JSON data, do
//
//     final otpdata = otpdataFromJson(jsonString);

import 'dart:convert';

Otpdata otpdataFromJson(String str) => Otpdata.fromJson(json.decode(str));

String otpdataToJson(Otpdata data) => json.encode(data.toJson());

class Otpdata {
  Otpdata({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  Result? result;

  factory Otpdata.fromJson(Map<String, dynamic> json) => Otpdata(
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
    this.otp,
    this.message,
    this.token,
  });

  String? otp;
  String? message;
  String? token;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    otp: json["otp"],
    message: json["message"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
    "message": message,
    "token": token,
  };
}
