// To parse this JSON data, do
//
//     final readinessDetailsModels = readinessDetailsModelsFromJson(jsonString);

import 'dart:convert';

ReadinessDetailsModels readinessDetailsModelsFromJson(String str) => ReadinessDetailsModels.fromJson(json.decode(str));

String readinessDetailsModelsToJson(ReadinessDetailsModels data) => json.encode(data.toJson());

class ReadinessDetailsModels {
  int? status;
  String? message;
  Result? result;

  ReadinessDetailsModels({
    this.status,
    this.message,
    this.result,
  });

  factory ReadinessDetailsModels.fromJson(Map<String, dynamic> json) => ReadinessDetailsModels(
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
  String? truckMacYear;
  String? fitUnfit;
  String? driver1Id;
  String? driver2Id;
  String? driver1PhoneNo;
  String? driver2PhoneNo;
  String? truckNumber;
  String? cityDriverName;
  String? cityTruck;
  String? padLock;
  dynamic fuel;
  String? truckMac2Year;
  int? status;
  String? tripId;
  String? createdOn;
  String? createdBy;
  String? cityDrivername;
  String? driver1Name;
  String? driver2Name;
  int? orderId;
  String? id;
  String? tripDetails;
  String? cityDriverId;

  ResultElement({
    this.truckMacYear,
    this.fitUnfit,
    this.driver1Id,
    this.driver2Id,
    this.driver1PhoneNo,
    this.driver2PhoneNo,
    this.truckNumber,
    this.cityDriverName,
    this.cityTruck,
    this.padLock,
    this.fuel,
    this.truckMac2Year,
    this.status,
    this.tripId,
    this.createdOn,
    this.createdBy,
    this.cityDrivername,
    this.driver1Name,
    this.driver2Name,
    this.orderId,
    this.id,
    this.tripDetails,
    this.cityDriverId,
  });

  factory ResultElement.fromJson(Map<String, dynamic> json) => ResultElement(
    truckMacYear: json["truckMacYear"],
    fitUnfit: json["fitUnfit"],
    driver1Id: json["driver1Id"],
    driver2Id: json["driver2Id"],
    driver1PhoneNo: json["driver1PhoneNo"],
    driver2PhoneNo: json["driver2PhoneNo"],
    truckNumber: json["truckNumber"],
    cityDriverName: json["cityDriverName"],
    cityTruck: json["cityTruck"],
    padLock: json["padLock"],
    fuel: json["fuel"],
    truckMac2Year: json["truckMac2Year"],
    status: json["status"],
    tripId: json["tripId"],
    createdOn: json["createdOn"],
    createdBy: json["createdBy"],
    cityDrivername: json["cityDrivername"],
    driver1Name: json["driver1Name"],
    driver2Name: json["driver2Name"],
    orderId: json["orderId"],
    id: json["id"],
    tripDetails: json["tripDetails"],
    cityDriverId: json["cityDriverId"],
  );

  Map<String, dynamic> toJson() => {
    "truckMacYear": truckMacYear,
    "fitUnfit": fitUnfit,
    "driver1Id": driver1Id,
    "driver2Id": driver2Id,
    "driver1PhoneNo": driver1PhoneNo,
    "driver2PhoneNo": driver2PhoneNo,
    "truckNumber": truckNumber,
    "cityDriverName": cityDriverName,
    "cityTruck": cityTruck,
    "padLock": padLock,
    "fuel": fuel,
    "truckMac2Year": truckMac2Year,
    "status": status,
    "tripId": tripId,
    "createdOn": createdOn,
    "createdBy": createdBy,
    "cityDrivername": cityDrivername,
    "driver1Name": driver1Name,
    "driver2Name": driver2Name,
    "orderId": orderId,
    "id": id,
    "tripDetails": tripDetails,
    "cityDriverId": cityDriverId,
  };
}
