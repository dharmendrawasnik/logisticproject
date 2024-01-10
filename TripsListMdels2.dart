// To parse this JSON data, do
//
//     final tripsListModels2 = tripsListModels2FromJson(jsonString);

import 'dart:convert';

TripsListModels2 tripsListModels2FromJson(String str) => TripsListModels2.fromJson(json.decode(str));

String tripsListModels2ToJson(TripsListModels2 data) => json.encode(data.toJson());

class TripsListModels2 {
  TripsListModels2({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  List<Result>? result;

  factory TripsListModels2.fromJson(Map<String, dynamic> json) => TripsListModels2(
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
    this.id,
    this.tripId,
    this.readnessStatus,
  });

  DateTime? firstpickAppoitmentDate;
  DateTime? lastpickAppoitmentDate;
  int? orderId;
  String? city;
  String? lastCity;
  String? lastFacility;
  String? customerPo;
  String? facility;
  String? customerName;
  String? status;
  String? tripStatus;
  String? id;
  String? tripId;
  bool? readnessStatus;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    firstpickAppoitmentDate: json["firstpickAppoitmentDate"] == null ? null : DateTime.parse(json["firstpickAppoitmentDate"]),
    lastpickAppoitmentDate: json["lastpickAppoitmentDate"] == null ? null : DateTime.parse(json["lastpickAppoitmentDate"]),
    orderId: json["orderId"],
    city: json["city"],
    lastCity: json["lastCity"],
    lastFacility: json["lastFacility"],
    customerPo: json["customerPo"],
    facility: json["facility"],
    customerName: json["customerName"],
    status: json["status"],
    tripStatus: json["tripStatus"],
    id: json["id"],
    tripId: json["tripId"],
    readnessStatus: json["readness_status"],
  );

  Map<String, dynamic> toJson() => {
    "firstpickAppoitmentDate": firstpickAppoitmentDate?.toIso8601String(),
    "lastpickAppoitmentDate": lastpickAppoitmentDate?.toIso8601String(),
    "orderId": orderId,
    "city": city,
    "lastCity": lastCity,
    "lastFacility": lastFacility,
    "customerPo": customerPo,
    "facility": facility,
    "customerName": customerName,
    "status": status,
    "tripStatus": tripStatus,
    "id": id,
    "tripId": tripId,
    "readness_status": readnessStatus,
  };
}
