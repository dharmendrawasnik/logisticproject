// To parse this JSON data, do
//
//     final vehicleDetailsModels = vehicleDetailsModelsFromJson(jsonString);

import 'dart:convert';

VehicleDetailsModels vehicleDetailsModelsFromJson(String str) => VehicleDetailsModels.fromJson(json.decode(str));

String vehicleDetailsModelsToJson(VehicleDetailsModels data) => json.encode(data.toJson());

class VehicleDetailsModels {
  int? status;
  String? message;
  Result? result;

  VehicleDetailsModels({
    this.status,
    this.message,
    this.result,
  });

  factory VehicleDetailsModels.fromJson(Map<String, dynamic> json) => VehicleDetailsModels(
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
  String? frontDeskDetail;
  String? mainDeskDetail;
  String? maxFreightWeight;
  String? rearDeskDetail;
  String? trailerGps;
  String? trailerLastAnnualSafetyCheck;
  String? trailerLastPreventiveMaintenance;
  String? trailerNumber;
  String? trailermakeYear;
  String? truckGps;
  String? truckLastAnnualSafetyCheck;
  String? truckNumber;
  String? trucklastPreventiveMaintenance;
  String? truckmakeYear;
  String? statusText;
  int? status;
  String? createdOn;
  String? createdBy;
  String? id;
  String? trailerName;
  String? trailerId;

  ResultElement({
    this.frontDeskDetail,
    this.mainDeskDetail,
    this.maxFreightWeight,
    this.rearDeskDetail,
    this.trailerGps,
    this.trailerLastAnnualSafetyCheck,
    this.trailerLastPreventiveMaintenance,
    this.trailerNumber,
    this.trailermakeYear,
    this.truckGps,
    this.truckLastAnnualSafetyCheck,
    this.truckNumber,
    this.trucklastPreventiveMaintenance,
    this.truckmakeYear,
    this.statusText,
    this.status,
    this.createdOn,
    this.createdBy,
    this.id,
    this.trailerName,
    this.trailerId,
  });

  factory ResultElement.fromJson(Map<String, dynamic> json) => ResultElement(
    frontDeskDetail: json["frontDeskDetail"],
    mainDeskDetail: json["mainDeskDetail"],
    maxFreightWeight: json["maxFreightWeight"],
    rearDeskDetail: json["rearDeskDetail"],
    trailerGps: json["trailerGPS"],
    trailerLastAnnualSafetyCheck: json["trailerLastAnnualSafetyCheck"],
    trailerLastPreventiveMaintenance: json["trailerLastPreventiveMaintenance"],
    trailerNumber: json["trailerNumber"],
    trailermakeYear: json["trailermakeYear"],
    truckGps: json["truckGPS"],
    truckLastAnnualSafetyCheck: json["truckLastAnnualSafetyCheck"],
    truckNumber: json["truckNumber"],
    trucklastPreventiveMaintenance: json["trucklastPreventiveMaintenance"],
    truckmakeYear: json["truckmakeYear"],
    statusText: json["statusText"],
    status: json["status"],
    createdOn: json["createdOn"],
    createdBy: json["createdBy"],
    id: json["id"],
    trailerName: json["trailerName"],
    trailerId: json["trailerId"],
  );

  Map<String, dynamic> toJson() => {
    "frontDeskDetail": frontDeskDetail,
    "mainDeskDetail": mainDeskDetail,
    "maxFreightWeight": maxFreightWeight,
    "rearDeskDetail": rearDeskDetail,
    "trailerGPS": trailerGps,
    "trailerLastAnnualSafetyCheck": trailerLastAnnualSafetyCheck,
    "trailerLastPreventiveMaintenance": trailerLastPreventiveMaintenance,
    "trailerNumber": trailerNumber,
    "trailermakeYear": trailermakeYear,
    "truckGPS": truckGps,
    "truckLastAnnualSafetyCheck": truckLastAnnualSafetyCheck,
    "truckNumber": truckNumber,
    "trucklastPreventiveMaintenance": trucklastPreventiveMaintenance,
    "truckmakeYear": truckmakeYear,
    "statusText": statusText,
    "status": status,
    "createdOn": createdOn,
    "createdBy": createdBy,
    "id": id,
    "trailerName": trailerName,
    "trailerId": trailerId,
  };
}
