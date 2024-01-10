// To parse this JSON data, do
//
//     final vehicleDataId = vehicleDataIdFromJson(jsonString);

import 'dart:convert';

VehicleDataId vehicleDataIdFromJson(String str) => VehicleDataId.fromJson(json.decode(str));

String vehicleDataIdToJson(VehicleDataId data) => json.encode(data.toJson());

class VehicleDataId {
  VehicleDataId({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  Result? result;

  factory VehicleDataId.fromJson(Map<String, dynamic> json) => VehicleDataId(
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
    this.totalCount,
    this.result,
  });

  int? totalCount;
  List<ResultElement>? result;

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
  ResultElement({
    this.statusText,
    this.trailerName,
    this.status,
    this.createdOn,
    this.createdBy,
    this.id,
  });

  String? statusText;
  String? trailerName;
  int? status;
  String? createdOn;
  String? createdBy;
  String? id;

  factory ResultElement.fromJson(Map<String, dynamic> json) => ResultElement(
    statusText: json["statusText"],
    trailerName: json["trailerName"],
    status: json["status"],
    createdOn: json["createdOn"],
    createdBy: json["createdBy"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "statusText": statusText,
    "trailerName": trailerName,
    "status": status,
    "createdOn": createdOn,
    "createdBy": createdBy,
    "id": id,
  };
}
