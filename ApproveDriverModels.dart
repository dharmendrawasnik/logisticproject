// To parse this JSON data, do
//
//     final approveDriverModels = approveDriverModelsFromJson(jsonString);

import 'dart:convert';

ApproveDriverModels approveDriverModelsFromJson(String str) => ApproveDriverModels.fromJson(json.decode(str));

String approveDriverModelsToJson(ApproveDriverModels data) => json.encode(data.toJson());

class ApproveDriverModels {
  ApproveDriverModels({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  Result? result;

  factory ApproveDriverModels.fromJson(Map<String, dynamic> json) => ApproveDriverModels(
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
    this.vendorId,
    this.driverId,
    this.status,
    this.createdOn,
    this.createdBy,
    this.id,
  });

  String? statusText;
  String? vendorId;
  String? driverId;
  int? status;
  String? createdOn;
  String? createdBy;
  String? id;

  factory ResultElement.fromJson(Map<String, dynamic> json) => ResultElement(
    statusText: json["statusText"],
    vendorId: json["vendorId"],
    driverId: json["driverId"],
    status: json["status"],
    createdOn: json["createdOn"],
    createdBy: json["createdBy"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "statusText": statusText,
    "vendorId": vendorId,
    "driverId": driverId,
    "status": status,
    "createdOn": createdOn,
    "createdBy": createdBy,
    "id": id,
  };
}
