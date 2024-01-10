// To parse this JSON data, do
//
//     final driveListModels123 = driveListModels123FromJson(jsonString);

import 'dart:convert';

DriveListModels123 driveListModels123FromJson(String str) => DriveListModels123.fromJson(json.decode(str));

String driveListModels123ToJson(DriveListModels123 data) => json.encode(data.toJson());

class DriveListModels123 {
  DriveListModels123({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  List<Result>? result;

  factory DriveListModels123.fromJson(Map<String, dynamic> json) => DriveListModels123(
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
    this.image,
    this.firstName,
    this.lastName,
    this.countryCode,
    this.mobileNo,
    this.email,
    this.password,
    this.vendorId,
    this.licenseClassId,
    this.endorsment,
    this.otp,
    this.status,
    this.id,
    this.createdBy,
    this.createdOn,
    this.licenseNo,
    this.statusText,
    this.upatedBy,
    this.updatedOn,
  });

  dynamic image;
  String? firstName;
  String? lastName;
  String? countryCode;
  String? mobileNo;
  String? email;
  String? password;
  String? vendorId;
  String? licenseClassId;
  String? endorsment;
  String? otp;
  int? status;
  String? id;
  String? createdBy;
  double? createdOn;
  String? licenseNo;
  String? statusText;
  String? upatedBy;
  double? updatedOn;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    image: json["image"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    countryCode: json["countryCode"],
    mobileNo: json["mobileNo"],
    email: json["email"],
    password: json["password"],
    vendorId: json["vendorId"],
    licenseClassId: json["licenseClassId"],
    endorsment: json["endorsment"],
    otp: json["otp"],
    status: json["status"],
    id: json["id"],
    createdBy: json["createdBy"],
    createdOn: json["createdOn"]?.toDouble(),
    licenseNo: json["licenseNo"],
    statusText: json["statusText"],
    upatedBy: json["upatedBy"],
    updatedOn: json["updatedOn"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "firstName": firstName,
    "lastName": lastName,
    "countryCode": countryCode,
    "mobileNo": mobileNo,
    "email": email,
    "password": password,
    "vendorId": vendorId,
    "licenseClassId": licenseClassId,
    "endorsment": endorsment,
    "otp": otp,
    "status": status,
    "id": id,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "licenseNo": licenseNo,
    "statusText": statusText,
    "upatedBy": upatedBy,
    "updatedOn": updatedOn,
  };
}

class ImageClass {
  ImageClass({
    this.url,
  });

  String? url;

  factory ImageClass.fromJson(Map<String, dynamic> json) => ImageClass(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}
