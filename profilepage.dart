// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  List<Result>? result;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
  Result({
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.mobileNo,
    this.password,
    this.image,
    this.otp,
    this.upatedBy,
    this.updatedOn,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? countryCode;
  String? mobileNo;
  String? password;
  String? image;
  String? otp;
  String? upatedBy;
  double? updatedOn;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    countryCode: json["countryCode"],
    mobileNo: json["mobileNo"],
    password: json["password"],
    image: json["image"],
    otp: json["otp"],
    upatedBy: json["upatedBy"],
    updatedOn: json["updatedOn"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "countryCode": countryCode,
    "mobileNo": mobileNo,
    "password": password,
    "image": image,
    "otp": otp,
    "upatedBy": upatedBy,
    "updatedOn": updatedOn,
  };
}
