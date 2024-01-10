// To parse this JSON data, do
//
//     final tripsDispatchModels = tripsDispatchModelsFromJson(jsonString);

import 'dart:convert';

TripsDispatchModels tripsDispatchModelsFromJson(String str) => TripsDispatchModels.fromJson(json.decode(str));

String tripsDispatchModelsToJson(TripsDispatchModels data) => json.encode(data.toJson());

class TripsDispatchModels {
  int? status;
  String? message;
  List<Result>? result;

  TripsDispatchModels({
    this.status,
    this.message,
    this.result,
  });

  factory TripsDispatchModels.fromJson(Map<String, dynamic> json) => TripsDispatchModels(
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
  String? firstpickAppoitmentDate;
  String? lastpickAppoitmentDate;
  int? orderId;
  String? city;
  String? lastCity;
  String? lastFacility;
  String? customerPo;
  String? facility;
  String? customerName;
  String? status;
  String? tripStatus;
  String? driverId;
  int? saftysecurityform;
  List<DriverDetail>? driverDetail;
  String? id;
  String? tripId;
  bool? readnessStatus;

  Result({
    this.firstpickAppoitmentDate,
    this.lastpickAppoitmentDate,
    this.orderId,
    this.city,
    this.lastCity,
    this.lastFacility,
    this.customerPo,
    this.facility,
    this.customerName,
    this.status,
    this.tripStatus,
    this.driverId,
    this.saftysecurityform,
    this.driverDetail,
    this.id,
    this.tripId,
    this.readnessStatus,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    firstpickAppoitmentDate: json["firstpickAppoitmentDate"],
    lastpickAppoitmentDate: json["lastpickAppoitmentDate"],
    orderId: json["orderId"],
    city: json["city"],
    lastCity: json["lastCity"],
    lastFacility: json["lastFacility"],
    customerPo: json["customerPo"],
    facility: json["facility"],
    customerName: json["customerName"],
    status: json["status"],
    tripStatus: json["tripStatus"],
    driverId: json["driverId"],
    saftysecurityform: json["saftysecurityform"],
    driverDetail: json["driverDetail"] == null ? [] : List<DriverDetail>.from(json["driverDetail"]!.map((x) => DriverDetail.fromJson(x))),
    id: json["id"],
    tripId: json["tripId"],
    readnessStatus: json["readness_status"],
  );

  Map<String, dynamic> toJson() => {
    "firstpickAppoitmentDate": firstpickAppoitmentDate,
    "lastpickAppoitmentDate": lastpickAppoitmentDate,
    "orderId": orderId,
    "city": city,
    "lastCity": lastCity,
    "lastFacility": lastFacility,
    "customerPo": customerPo,
    "facility": facility,
    "customerName": customerName,
    "status": status,
    "tripStatus": tripStatus,
    "driverId": driverId,
    "saftysecurityform": saftysecurityform,
    "driverDetail": driverDetail == null ? [] : List<dynamic>.from(driverDetail!.map((x) => x.toJson())),
    "id": id,
    "tripId": tripId,
    "readness_status": readnessStatus,
  };
}

class DriverDetail {
  String? firstName;
  String? lastName;
  String? countryCode;
  String? mobileNo;
  String? email;
  String? password;
  String? licenseNo;
  String? licenseClassId;
  String? endorsment;
  String? statusText;
  String? image;
  String? vendorId;
  String? otp;
  int? status;
  double? createdOn;
  String? createdBy;
  String? driverId;

  DriverDetail({
    this.firstName,
    this.lastName,
    this.countryCode,
    this.mobileNo,
    this.email,
    this.password,
    this.licenseNo,
    this.licenseClassId,
    this.endorsment,
    this.statusText,
    this.image,
    this.vendorId,
    this.otp,
    this.status,
    this.createdOn,
    this.createdBy,
    this.driverId,
  });

  factory DriverDetail.fromJson(Map<String, dynamic> json) => DriverDetail(
    firstName: json["firstName"],
    lastName: json["lastName"],
    countryCode: json["countryCode"],
    mobileNo: json["mobileNo"],
    email: json["email"],
    password: json["password"],
    licenseNo: json["licenseNo"],
    licenseClassId: json["licenseClassId"],
    endorsment: json["endorsment"],
    statusText: json["statusText"],
    image: json["image"],
    vendorId: json["vendorId"],
    otp: json["otp"],
    status: json["status"],
    createdOn: json["createdOn"]?.toDouble(),
    createdBy: json["createdBy"],
    driverId: json["driverId"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "countryCode": countryCode,
    "mobileNo": mobileNo,
    "email": email,
    "password": password,
    "licenseNo": licenseNo,
    "licenseClassId": licenseClassId,
    "endorsment": endorsment,
    "statusText": statusText,
    "image": image,
    "vendorId": vendorId,
    "otp": otp,
    "status": status,
    "createdOn": createdOn,
    "createdBy": createdBy,
    "driverId": driverId,
  };
}
