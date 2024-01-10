// To parse this JSON data, do
//
//     final tripsId = tripsIdFromJson(jsonString);

import 'dart:convert';

TripsId tripsIdFromJson(String str) => TripsId.fromJson(json.decode(str));

String tripsIdToJson(TripsId data) => json.encode(data.toJson());

class TripsId {
  TripsId({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  List<Result>? result;

  factory TripsId.fromJson(Map<String, dynamic> json) => TripsId(
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
  Result({
    this.id,
    this.detail,
  });

  String? id;
  String? detail;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    detail: json["detail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "detail": detail,
  };
}
