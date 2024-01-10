// To parse this JSON data, do
//
//     final maintananceData = maintananceDataFromJson(jsonString);

import 'dart:convert';

MaintananceData maintananceDataFromJson(String str) => MaintananceData.fromJson(json.decode(str));

String maintananceDataToJson(MaintananceData data) => json.encode(data.toJson());

class MaintananceData {
  int? status;
  String? message;
  Result? result;

  MaintananceData({
    this.status,
    this.message,
    this.result,
  });

  factory MaintananceData.fromJson(Map<String, dynamic> json) => MaintananceData(
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
  int? totalCount;
  List<ResultElement>? result;

  Result({
    this.totalCount,
    this.result,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    totalCount: json["Total Count"],
    result: json["Result"] == null ? [] : List<ResultElement>.from(json["Result"]!.map((x) => ResultElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Total Count": totalCount,
    "Result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class ResultElement {
  String? vehicleLicense;
  String? driverLicense;
  String? insurance;
  String? vehicleMaintainance;
  String? maintenanceYear;
  String? driverMediclaim;
  String? vehicleId;
  String? statusText;
  int? status;
  String? createdOn;
  String? createdBy;
  String? id;
  String? vehicleText;

  ResultElement({
    this.vehicleLicense,
    this.driverLicense,
    this.insurance,
    this.vehicleMaintainance,
    this.maintenanceYear,
    this.driverMediclaim,
    this.vehicleId,
    this.statusText,
    this.status,
    this.createdOn,
    this.createdBy,
    this.id,
    this.vehicleText,
  });

  factory ResultElement.fromJson(Map<String, dynamic> json) => ResultElement(
    vehicleLicense: json["vehicleLicense"],
    driverLicense: json["driverLicense"],
    insurance: json["insurance"],
    vehicleMaintainance: json["vehicleMaintainance"],
    maintenanceYear: json["maintenanceYear"],
    driverMediclaim: json["driverMediclaim"],
    vehicleId: json["vehicleId"],
    statusText: json["statusText"],
    status: json["status"],
    createdOn: json["createdOn"],
    createdBy: json["createdBy"],
    id: json["id"],
    vehicleText: json["vehicleText"],
  );

  Map<String, dynamic> toJson() => {
    "vehicleLicense": vehicleLicense,
    "driverLicense": driverLicense,
    "insurance": insurance,
    "vehicleMaintainance": vehicleMaintainance,
    "maintenanceYear": maintenanceYear,
    "driverMediclaim": driverMediclaim,
    "vehicleId": vehicleId,
    "statusText": statusText,
    "status": status,
    "createdOn": createdOn,
    "createdBy": createdBy,
    "id": id,
    "vehicleText": vehicleText,
  };
}
