// To parse this JSON data, do
//
//     final tripExpansesModels1 = tripExpansesModels1FromJson(jsonString);

import 'dart:convert';

TripExpansesModels1 tripExpansesModels1FromJson(String str) => TripExpansesModels1.fromJson(json.decode(str));

String tripExpansesModels1ToJson(TripExpansesModels1 data) => json.encode(data.toJson());

class TripExpansesModels1 {
  int? status;
  String? message;
  Result? result;

  TripExpansesModels1({
    this.status,
    this.message,
    this.result,
  });

  factory TripExpansesModels1.fromJson(Map<String, dynamic> json) => TripExpansesModels1(
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
  String? driverCharges;
  String? foodCharges;
  String? fuelCharges;
  String? otherCharges;
  String? tripId;
  String? statusText;
  String? tripDetails;
  int? status;
  String? createdOn;
  String? createdBy;
  String? id;
  int? total;

  ResultElement({
    this.driverCharges,
    this.foodCharges,
    this.fuelCharges,
    this.otherCharges,
    this.tripId,
    this.statusText,
    this.tripDetails,
    this.status,
    this.createdOn,
    this.createdBy,
    this.id,
    this.total,
  });

  factory ResultElement.fromJson(Map<String, dynamic> json) => ResultElement(
    driverCharges: json["driverCharges"],
    foodCharges: json["foodCharges"],
    fuelCharges: json["fuelCharges"],
    otherCharges: json["otherCharges"],
    tripId: json["tripId"],
    statusText: json["statusText"],
    tripDetails: json["tripDetails"],
    status: json["status"],
    createdOn: json["createdOn"],
    createdBy: json["createdBy"],
    id: json["id"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "driverCharges": driverCharges,
    "foodCharges": foodCharges,
    "fuelCharges": fuelCharges,
    "otherCharges": otherCharges,
    "tripId": tripId,
    "statusText": statusText,
    "tripDetails": tripDetails,
    "status": status,
    "createdOn": createdOn,
    "createdBy": createdBy,
    "id": id,
    "total": total,
  };
}
