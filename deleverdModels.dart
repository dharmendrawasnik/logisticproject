// To parse this JSON data, do
//
//     final deleverdModels = deleverdModelsFromJson(jsonString);

import 'dart:convert';

DeleverdModels deleverdModelsFromJson(String str) => DeleverdModels.fromJson(json.decode(str));

String deleverdModelsToJson(DeleverdModels data) => json.encode(data.toJson());

class DeleverdModels {
  int? status;
  String? message;
  List<Result>? result;

  DeleverdModels({
    this.status,
    this.message,
    this.result,
  });

  factory DeleverdModels.fromJson(Map<String, dynamic> json) => DeleverdModels(
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
    status: json["status"],
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
    "status": status,
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
  FirstName? firstName;
  LastName? lastName;
  String? countryCode;
  String? mobileNo;
  Email? email;
  String? password;
  LicenseNo? licenseNo;
  LicenseClassId? licenseClassId;
  Endorsment? endorsment;
  StatusText? statusText;
  String? image;
  VendorId? vendorId;
  String? otp;
  int? status;
  double? createdOn;
  DriverId? createdBy;
  DriverId? driverId;

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
    firstName: firstNameValues.map[json["firstName"]]!,
    lastName: lastNameValues.map[json["lastName"]]!,
    countryCode: json["countryCode"],
    mobileNo: json["mobileNo"],
    email: emailValues.map[json["email"]]!,
    password: json["password"],
    licenseNo: licenseNoValues.map[json["licenseNo"]]!,
    licenseClassId: licenseClassIdValues.map[json["licenseClassId"]]!,
    endorsment: endorsmentValues.map[json["endorsment"]]!,
    statusText: statusTextValues.map[json["statusText"]]!,
    image: json["image"],
    vendorId: vendorIdValues.map[json["vendorId"]]!,
    otp: json["otp"],
    status: json["status"],
    createdOn: json["createdOn"]?.toDouble(),
    createdBy: driverIdValues.map[json["createdBy"]]!,
    driverId: driverIdValues.map[json["driverId"]]!,
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstNameValues.reverse[firstName],
    "lastName": lastNameValues.reverse[lastName],
    "countryCode": countryCode,
    "mobileNo": mobileNo,
    "email": emailValues.reverse[email],
    "password": password,
    "licenseNo": licenseNoValues.reverse[licenseNo],
    "licenseClassId": licenseClassIdValues.reverse[licenseClassId],
    "endorsment": endorsmentValues.reverse[endorsment],
    "statusText": statusTextValues.reverse[statusText],
    "image": image,
    "vendorId": vendorIdValues.reverse[vendorId],
    "otp": otp,
    "status": status,
    "createdOn": createdOn,
    "createdBy": driverIdValues.reverse[createdBy],
    "driverId": driverIdValues.reverse[driverId],
  };
}

enum DriverId { THE_6426_C088_B7_BF8_EB10_E2_F9_A1_C, THE_64394_A239482709_E3_AFE546_C }

final driverIdValues = EnumValues({
  "6426c088b7bf8eb10e2f9a1c": DriverId.THE_6426_C088_B7_BF8_EB10_E2_F9_A1_C,
  "64394a239482709e3afe546c": DriverId.THE_64394_A239482709_E3_AFE546_C
});

enum Email { T_GMAIL_COM, LANKESH_GMAIL_COM }

final emailValues = EnumValues({
  "Lankesh@gmail.com": Email.LANKESH_GMAIL_COM,
  "t@gmail.com": Email.T_GMAIL_COM
});

enum Endorsment { THE_617_F7_C8_FFB5_CB4_CFE72_D8_D6_A, EMPTY }

final endorsmentValues = EnumValues({
  "": Endorsment.EMPTY,
  "617f7c8ffb5cb4cfe72d8d6a": Endorsment.THE_617_F7_C8_FFB5_CB4_CFE72_D8_D6_A
});

enum FirstName { RAVINDR, LANKESH }

final firstNameValues = EnumValues({
  "Lankesh": FirstName.LANKESH,
  "Ravindr": FirstName.RAVINDR
});

enum LastName { SHARMA, RATHORE }

final lastNameValues = EnumValues({
  "Rathore": LastName.RATHORE,
  "Sharma": LastName.SHARMA
});

enum LicenseClassId { THE_623_D3_A70_DF44_DB77_E6901995 }

final licenseClassIdValues = EnumValues({
  "623d3a70df44db77e6901995": LicenseClassId.THE_623_D3_A70_DF44_DB77_E6901995
});

enum LicenseNo { THE_67_YUHHAHG }

final licenseNoValues = EnumValues({
  "67YUHHAHG": LicenseNo.THE_67_YUHHAHG
});

enum StatusText { INACTIVE, ACTIVE }

final statusTextValues = EnumValues({
  "Active": StatusText.ACTIVE,
  "Inactive": StatusText.INACTIVE
});

enum VendorId { THE_625191_A0_E9268070_F5015984 }

final vendorIdValues = EnumValues({
  "625191a0e9268070f5015984": VendorId.THE_625191_A0_E9268070_F5015984
});

enum TripStatus { THE_619_E2497_B34_EBB0_F38_FE2601 }

final tripStatusValues = EnumValues({
  "619e2497b34ebb0f38fe2601": TripStatus.THE_619_E2497_B34_EBB0_F38_FE2601
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
