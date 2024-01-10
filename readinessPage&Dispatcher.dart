// To parse this JSON data, do
//
//     final reaninesssDispatcherPage = reaninesssDispatcherPageFromJson(jsonString);

import 'dart:convert';

ReaninesssDispatcherPage reaninesssDispatcherPageFromJson(String str) => ReaninesssDispatcherPage.fromJson(json.decode(str));

String reaninesssDispatcherPageToJson(ReaninesssDispatcherPage data) => json.encode(data.toJson());

class ReaninesssDispatcherPage {
  int? status;
  String? message;
  Result? result;

  ReaninesssDispatcherPage({
    this.status,
    this.message,
    this.result,
  });

  factory ReaninesssDispatcherPage.fromJson(Map<String, dynamic> json) => ReaninesssDispatcherPage(
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
  String? truckMac2Year;
  String? tripId;
  String? createdOn;
  String? createdBy;
  int? status;
  String? statusText;
  String? id;

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
    this.truckMac2Year,
    this.tripId,
    this.createdOn,
    this.createdBy,
    this.status,
    this.statusText,
    this.id,
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
    truckMac2Year: json["truckMac2Year"],
    tripId: json["tripId"],
    createdOn: json["createdOn"],
    createdBy: json["createdBy"],
    status: json["status"],
    statusText: json["statusText"],
    id: json["id"],
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
    "truckMac2Year": truckMac2Year,
    "tripId": tripId,
    "createdOn": createdOn,
    "createdBy": createdBy,
    "status": status,
    "statusText": statusText,
    "id": id,
  };
}
