// To parse this JSON data, do
//
//     final vendorModel = vendorModelFromJson(jsonString);

import 'dart:convert';

VendorModel vendorModelFromJson(String str) => VendorModel.fromJson(json.decode(str));

String vendorModelToJson(VendorModel data) => json.encode(data.toJson());

class VendorModel {
  VendorModel({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  List<VendorModelResult>? result;

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
    status: json["status"],
    message: json["message"],
    result: json["result"] == null ? [] : List<VendorModelResult>.from(json["result"]!.map((x) => VendorModelResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class VendorModelResult {
  VendorModelResult({
    this.image,
    this.firstName,
    this.lastName,
    this.countryCode,
    this.mobileNo,
    this.email,
    this.password,
    this.statusText,
    this.status,
    this.createdOn,
    this.createdBy,
    this.otp,
    this.id,
    this.upatedBy,
    this.updatedOn,
  });

  dynamic image;
  String? firstName;
  String? lastName;
  CountryCode? countryCode;
  String? mobileNo;
  String? email;
  String? password;
  StatusText? statusText;
  int? status;
  double? createdOn;
  CreatedBy? createdBy;
  String? otp;
  String? id;
  String? upatedBy;
  double? updatedOn;

  factory VendorModelResult.fromJson(Map<String, dynamic> json) => VendorModelResult(
    image: json["image"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    countryCode: countryCodeValues.map[json["countryCode"]]!,
    mobileNo: json["mobileNo"],
    email: json["email"],
    password: json["password"],
    statusText: statusTextValues.map[json["statusText"]]!,
    status: json["status"],
    createdOn: json["createdOn"]?.toDouble(),
    createdBy: createdByValues.map[json["createdBy"]]!,
    otp: json["otp"],
    id: json["id"],
    upatedBy: json["upatedBy"],
    updatedOn: json["updatedOn"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "firstName": firstName,
    "lastName": lastName,
    "countryCode": countryCodeValues.reverse[countryCode],
    "mobileNo": mobileNo,
    "email": email,
    "password": password,
    "statusText": statusTextValues.reverse[statusText],
    "status": status,
    "createdOn": createdOn,
    "createdBy": createdByValues.reverse[createdBy],
    "otp": otp,
    "id": id,
    "upatedBy": upatedBy,
    "updatedOn": updatedOn,
  };
}

enum CountryCode { THE_91, EMPTY, THE_1, NULL }

final countryCodeValues = EnumValues({
  "": CountryCode.EMPTY,
  "null": CountryCode.NULL,
  "+1": CountryCode.THE_1,
  "+91": CountryCode.THE_91
});

enum CreatedBy { USER_SIGNUP }

final createdByValues = EnumValues({
  "user signup": CreatedBy.USER_SIGNUP
});

class ImageClass {
  ImageClass({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  List<ImageResult>? result;

  factory ImageClass.fromJson(Map<String, dynamic> json) => ImageClass(
    status: json["status"],
    message: json["message"],
    result: json["result"] == null ? [] : List<ImageResult>.from(json["result"]!.map((x) => ImageResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class ImageResult {
  ImageResult({
    this.message,
  });

  String? message;

  factory ImageResult.fromJson(Map<String, dynamic> json) => ImageResult(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}

enum StatusText { ACTIVE }

final statusTextValues = EnumValues({
  "Active": StatusText.ACTIVE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
