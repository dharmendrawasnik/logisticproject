// To parse this JSON data, do
//
// To parse this JSON data, do
//
//     final assionLoadModels = assionLoadModelsFromJson(jsonString);

import 'dart:convert';

List<AssionLoadModels> assionLoadModelsFromJson(String str) => List<AssionLoadModels>.from(json.decode(str).map((x) => AssionLoadModels.fromJson(x)));

String assionLoadModelsToJson(List<AssionLoadModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssionLoadModels {
  String? tripId;
  String? driverId;
  String? statusText;
  int? acceptStatus;
  int? status;
  double? createdOn;
  String? createdBy;
  String? id;
  Trip? trip;
  Driver? driver;

  AssionLoadModels({
    this.tripId,
    this.driverId,
    this.statusText,
    this.acceptStatus,
    this.status,
    this.createdOn,
    this.createdBy,
    this.id,
    this.trip,
    this.driver,
  });

  factory AssionLoadModels.fromJson(Map<String, dynamic> json) => AssionLoadModels(
    tripId: json["tripId"],
    driverId: json["driverId"],
    statusText: json["statusText"],
    acceptStatus: json["accept_status"],
    status: json["status"],
    createdOn: json["createdOn"]?.toDouble(),
    createdBy: json["createdBy"],
    id: json["id"],
    trip: json["trip"] == null ? null : Trip.fromJson(json["trip"]),
    driver: json["driver"] == null ? null : Driver.fromJson(json["driver"]),
  );

  Map<String, dynamic> toJson() => {
    "tripId": tripId,
    "driverId": driverId,
    "statusText": statusText,
    "accept_status": acceptStatus,
    "status": status,
    "createdOn": createdOn,
    "createdBy": createdBy,
    "id": id,
    "trip": trip?.toJson(),
    "driver": driver?.toJson(),
  };
}

class Driver {
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
  String? firstname;
  String? lastname;

  Driver({
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
    this.firstname,
    this.lastname,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
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
    firstname: json["firstname"],
    lastname: json["lastname"],
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
    "firstname": firstname,
    "lastname": lastname,
  };
}

class Trip {
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

  Trip({
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
  });

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
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
  };
}
