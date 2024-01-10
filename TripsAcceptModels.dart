// To parse this JSON data, do
//
//     final tripsAccepteModels = tripsAccepteModelsFromJson(jsonString);

import 'dart:convert';

TripsAccepteModels tripsAccepteModelsFromJson(String str) => TripsAccepteModels.fromJson(json.decode(str));

String tripsAccepteModelsToJson(TripsAccepteModels data) => json.encode(data.toJson());

class TripsAccepteModels {
  int? status;
  String? message;
  List<Result>? result;

  TripsAccepteModels({
    this.status,
    this.message,
    this.result,
  });

  factory TripsAccepteModels.fromJson(Map<String, dynamic> json) => TripsAccepteModels(
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
  Status? status;
  TripStatus? tripStatus;
  DriverId? driverId;
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
    status: statusValues.map[json["status"]]!,
    tripStatus: tripStatusValues.map[json["tripStatus"]]!,
    driverId: driverIdValues.map[json["driverId"]]!,
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
    "status": statusValues.reverse[status],
    "tripStatus": tripStatusValues.reverse[tripStatus],
    "driverId": driverIdValues.reverse[driverId],
    "saftysecurityform": saftysecurityform,
    "driverDetail": driverDetail == null ? [] : List<dynamic>.from(driverDetail!.map((x) => x.toJson())),
    "id": id,
    "tripId": tripId,
    "readness_status": readnessStatus,
  };
}

class DriverDetail {
  String? image;
  FirstName? firstName;
  LastName? lastName;
  String? countryCode;
  String? mobileNo;
  Email? email;
  String? password;
  CreatedBy? vendorId;
  LicenseClassId? licenseClassId;
  Endorsment? endorsment;
  StatusText? statusText;
  String? otp;
  int? status;
  double? createdOn;
  CreatedBy? createdBy;
  DriverId? driverId;
  String? licenseNo;

  DriverDetail({
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
    this.statusText,
    this.otp,
    this.status,
    this.createdOn,
    this.createdBy,
    this.driverId,
    this.licenseNo,
  });

  factory DriverDetail.fromJson(Map<String, dynamic> json) => DriverDetail(
    image: json["image"],
    firstName: firstNameValues.map[json["firstName"]]!,
    lastName: lastNameValues.map[json["lastName"]]!,
    countryCode: json["countryCode"],
    mobileNo: json["mobileNo"],
    email: emailValues.map[json["email"]]!,
    password: json["password"],
    vendorId: createdByValues.map[json["vendorId"]]!,
    licenseClassId: licenseClassIdValues.map[json["licenseClassId"]]!,
    endorsment: endorsmentValues.map[json["endorsment"]]!,
    statusText: statusTextValues.map[json["statusText"]]!,
    otp: json["otp"],
    status: json["status"],
    createdOn: json["createdOn"]?.toDouble(),
    createdBy: createdByValues.map[json["createdBy"]]!,
    driverId: driverIdValues.map[json["driverId"]]!,
    licenseNo: json["licenseNo"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "firstName": firstNameValues.reverse[firstName],
    "lastName": lastNameValues.reverse[lastName],
    "countryCode": countryCode,
    "mobileNo": mobileNo,
    "email": emailValues.reverse[email],
    "password": password,
    "vendorId": createdByValues.reverse[vendorId],
    "licenseClassId": licenseClassIdValues.reverse[licenseClassId],
    "endorsment": endorsmentValues.reverse[endorsment],
    "statusText": statusTextValues.reverse[statusText],
    "otp": otp,
    "status": status,
    "createdOn": createdOn,
    "createdBy": createdByValues.reverse[createdBy],
    "driverId": driverIdValues.reverse[driverId],
    "licenseNo": licenseNo,
  };
}

enum CreatedBy { THE_625191_A0_E9268070_F5015984, THE_6426_C088_B7_BF8_EB10_E2_F9_A1_C }

final createdByValues = EnumValues({
  "625191a0e9268070f5015984": CreatedBy.THE_625191_A0_E9268070_F5015984,
  "6426c088b7bf8eb10e2f9a1c": CreatedBy.THE_6426_C088_B7_BF8_EB10_E2_F9_A1_C
});

enum DriverId { THE_643_CFDE1_D2064_B2_E025_F217_E, THE_6426_C088_B7_BF8_EB10_E2_F9_A1_C }

final driverIdValues = EnumValues({
  "6426c088b7bf8eb10e2f9a1c": DriverId.THE_6426_C088_B7_BF8_EB10_E2_F9_A1_C,
  "643cfde1d2064b2e025f217e": DriverId.THE_643_CFDE1_D2064_B2_E025_F217_E
});

enum Email { RAJU_GMAIL_COM, T_GMAIL_COM }

final emailValues = EnumValues({
  "Raju@gmail.com": Email.RAJU_GMAIL_COM,
  "t@gmail.com": Email.T_GMAIL_COM
});

enum Endorsment { EMPTY, THE_617_F7_C8_FFB5_CB4_CFE72_D8_D6_A }

final endorsmentValues = EnumValues({
  "": Endorsment.EMPTY,
  "617f7c8ffb5cb4cfe72d8d6a": Endorsment.THE_617_F7_C8_FFB5_CB4_CFE72_D8_D6_A
});

enum FirstName { RAKESH, RAVINDR }

final firstNameValues = EnumValues({
  "Rakesh": FirstName.RAKESH,
  "Ravindr": FirstName.RAVINDR
});

enum LastName { PARMAR, SHARMA }

final lastNameValues = EnumValues({
  "Parmar ": LastName.PARMAR,
  "Sharma": LastName.SHARMA
});

enum LicenseClassId { THE_623_D3_A70_DF44_DB77_E6901995 }

final licenseClassIdValues = EnumValues({
  "623d3a70df44db77e6901995": LicenseClassId.THE_623_D3_A70_DF44_DB77_E6901995
});

enum StatusText { ACTIVE, INACTIVE }

final statusTextValues = EnumValues({
  "Active": StatusText.ACTIVE,
  "Inactive": StatusText.INACTIVE
});

enum Status { IN_TRANSIST, DSFGDF, DISPATCHED }

final statusValues = EnumValues({
  "Dispatched": Status.DISPATCHED,
  "DSFGDF": Status.DSFGDF,
  "In_transist": Status.IN_TRANSIST
});

enum TripStatus { THE_619_E22_F1_B34_EBB0_F38_FE25_FF }

final tripStatusValues = EnumValues({
  "619e22f1b34ebb0f38fe25ff": TripStatus.THE_619_E22_F1_B34_EBB0_F38_FE25_FF
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
