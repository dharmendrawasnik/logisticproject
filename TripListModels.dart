// To parse this JSON data, do
//
//     final tripsListModels = tripsListModelsFromJson(jsonString);

import 'dart:convert';

TripsListModels tripsListModelsFromJson(String str) => TripsListModels.fromJson(json.decode(str));

String tripsListModelsToJson(TripsListModels data) => json.encode(data.toJson());

class TripsListModels {
  int? status;
  String? message;
  List<Result>? result;

  TripsListModels({
    this.status,
    this.message,
    this.result,
  });

  factory TripsListModels.fromJson(Map<String, dynamic> json) => TripsListModels(
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
  String? tripStatus;
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
    tripStatus: json["tripStatus"],
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
    "tripStatus": tripStatus,
    "id": id,
    "tripId": tripId,
    "readness_status": readnessStatus,
  };
}
