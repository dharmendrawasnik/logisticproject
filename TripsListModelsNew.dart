// To parse this JSON data, do
//
//     final tripsListModelsNew = tripsListModelsNewFromJson(jsonString);

import 'dart:convert';

TripsListModelsNew tripsListModelsNewFromJson(String str) => TripsListModelsNew.fromJson(json.decode(str));

String tripsListModelsNewToJson(TripsListModelsNew data) => json.encode(data.toJson());

class TripsListModelsNew {
  TripsListModelsNew({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  List<Result>? result;

  factory TripsListModelsNew.fromJson(Map<String, dynamic> json) => TripsListModelsNew(
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
  String? lastpickAppoitmentDate;
  dynamic orderId;
  City? city;
  LastCity? lastCity;
  LastFacility? lastFacility;
  String? customerPo;
  Facility? facility;
  String? customerName;
  Status? status;
  TripStatus? tripStatus;
  String? id;
  String? tripId;
  bool? readnessStatus;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    firstpickAppoitmentDate: json["firstpickAppoitmentDate"] == null ? null : DateTime.parse(json["firstpickAppoitmentDate"]),
    lastpickAppoitmentDate: json["lastpickAppoitmentDate"],
    orderId: json["orderId"],
    city: cityValues.map[json["city"]]!,
    lastCity: lastCityValues.map[json["lastCity"]]!,
    lastFacility: lastFacilityValues.map[json["lastFacility"]]!,
    customerPo: json["customerPo"],
    facility: facilityValues.map[json["facility"]]!,
    customerName: json["customerName"],
    status: statusValues.map[json["status"]]!,
    tripStatus: tripStatusValues.map[json["tripStatus"]]!,
    id: json["id"],
    tripId: json["tripId"],
    readnessStatus: json["readness_status"],
  );

  Map<String, dynamic> toJson() => {
    "firstpickAppoitmentDate": firstpickAppoitmentDate?.toIso8601String(),
    "lastpickAppoitmentDate": lastpickAppoitmentDate,
    "orderId": orderId,
    "city": cityValues.reverse[city],
    "lastCity": lastCityValues.reverse[lastCity],
    "lastFacility": lastFacilityValues.reverse[lastFacility],
    "customerPo": customerPo,
    "facility": facilityValues.reverse[facility],
    "customerName": customerName,
    "status": statusValues.reverse[status],
    "tripStatus": tripStatusValues.reverse[tripStatus],
    "id": id,
    "tripId": tripId,
    "readness_status": readnessStatus,
  };
}

enum City { MISSISSAUGA_ON_CANADA, RIMOUSKI_QC_CANADA, MADHYA_PRADESH_INDORE }

final cityValues = EnumValues({
  "Madhya Pradesh,Indore": City.MADHYA_PRADESH_INDORE,
  "MISSISSAUGA, ON, CANADA": City.MISSISSAUGA_ON_CANADA,
  "RIMOUSKI, QC, CANADA": City.RIMOUSKI_QC_CANADA
});

enum Facility { THE_6550_DANVILLE_RD, THE_542_RUE_DE_L_EPANSION, THE_542_NEW_BUILD }

final facilityValues = EnumValues({
  "542 New Build": Facility.THE_542_NEW_BUILD,
  "542 RUE DE L'EPANSION": Facility.THE_542_RUE_DE_L_EPANSION,
  "6550 DANVILLE RD": Facility.THE_6550_DANVILLE_RD
});

enum LastCity { MISSISSAUGA_ON_CANADA, LANGLEY_BC_CANADA, MADHYA_PRADESH_DHAR }

final lastCityValues = EnumValues({
  "LANGLEY, BC, CANADA": LastCity.LANGLEY_BC_CANADA,
  "Madhya Pradesh,dhar": LastCity.MADHYA_PRADESH_DHAR,
  "MISSISSAUGA, ON, CANADA": LastCity.MISSISSAUGA_ON_CANADA
});

enum LastFacility { THE_6550_DANVILLE_RD, THE_2757651_A_AVE }

final lastFacilityValues = EnumValues({
  "27576 51A AVE": LastFacility.THE_2757651_A_AVE,
  "6550 DANVILLE RD": LastFacility.THE_6550_DANVILLE_RD
});

enum Status { IN_TRANSIT, DELIVERED, IN_TRANSIST }

final statusValues = EnumValues({
  "Delivered": Status.DELIVERED,
  "In-Transist": Status.IN_TRANSIST,
  "In-Transit": Status.IN_TRANSIT
});

enum TripStatus { THE_617_FAC7_C611_FEECAE48_DA6_A8 }

final tripStatusValues = EnumValues({
  "617fac7c611feecae48da6a8": TripStatus.THE_617_FAC7_C611_FEECAE48_DA6_A8
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
