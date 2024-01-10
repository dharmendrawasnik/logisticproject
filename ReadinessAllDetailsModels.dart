// To parse this JSON data, do
//
//     final readinessAllDetailsModels = readinessAllDetailsModelsFromJson(jsonString);

import 'dart:convert';

ReadinessAllDetailsModels readinessAllDetailsModelsFromJson(String str) => ReadinessAllDetailsModels.fromJson(json.decode(str));

String readinessAllDetailsModelsToJson(ReadinessAllDetailsModels data) => json.encode(data.toJson());

class ReadinessAllDetailsModels {
  ReadinessAllDetailsModels({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  Result? result;

  factory ReadinessAllDetailsModels.fromJson(Map<String, dynamic> json) => ReadinessAllDetailsModels(
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
    this.carrierName,
    this.bpeOrder,
    this.truckNumber,
    this.truckMakingYear,
    this.lastAnnualSafetyCheckDate,
    this.lastPreventiveMaintenanceTruckDate,
    this.trailerNumber,
    this.trailerMakingYear,
    this.lastAnnualSafetyCheckDateTrailer,
    this.driver1Name,
    this.driver1NamePhoneNumber,
    this.driver1LicenseNumber,
    this.driver1ExperieceYear,
    this.driver2Name,
    this.driver2NamePhoneNumber,
    this.driver2LicenseNumber,
    this.driver2ExperieceYear,
    this.afterHoursContactDetails,
    this.truckFullFueiledUpForTrip,
    this.gpsTruckFunctioning,
    this.gpsTrailerFunctioning,
    this.padlockForThisRun,
    this.driverFitForDuty,
    this.weaterConcernFotThisTrip,
    this.lastPtiReportForTruck,
    this.lastPtiReportForTrailer,
    this.tripId,
    this.statusText,
    this.status,
    this.createdOn,
    this.createdBy,
    this.id,
  });

  String? carrierName;
  String? bpeOrder;
  String? truckNumber;
  String? truckMakingYear;
  String? lastAnnualSafetyCheckDate;
  String? lastPreventiveMaintenanceTruckDate;
  String? trailerNumber;
  String? trailerMakingYear;
  String? lastAnnualSafetyCheckDateTrailer;
  String? driver1Name;
  String? driver1NamePhoneNumber;
  String? driver1LicenseNumber;
  String? driver1ExperieceYear;
  String? driver2Name;
  String? driver2NamePhoneNumber;
  String? driver2LicenseNumber;
  String? driver2ExperieceYear;
  String? afterHoursContactDetails;
  bool? truckFullFueiledUpForTrip;
  String? gpsTruckFunctioning;
  bool? gpsTrailerFunctioning;
  String? padlockForThisRun;
  bool? driverFitForDuty;
  String? weaterConcernFotThisTrip;
  String? lastPtiReportForTruck;
  String? lastPtiReportForTrailer;
  String? tripId;
  String? statusText;
  int? status;
  String? createdOn;
  String? createdBy;
  String? id;

  factory ResultElement.fromJson(Map<String, dynamic> json) => ResultElement(
    carrierName: json["carrierName"],
    bpeOrder: json["BPEOrder"],
    truckNumber: json["truckNumber"],
    truckMakingYear: json["truckMakingYear"],
    lastAnnualSafetyCheckDate: json["lastAnnualSafetyCheckDate"],
    lastPreventiveMaintenanceTruckDate: json["lastPreventiveMaintenanceTruckDate"],
    trailerNumber: json["trailerNumber"],
    trailerMakingYear: json["trailerMakingYear"],
    lastAnnualSafetyCheckDateTrailer: json["lastAnnualSafetyCheckDateTrailer"],
    driver1Name: json["driver1Name"],
    driver1NamePhoneNumber: json["driver1NamePhoneNumber"],
    driver1LicenseNumber: json["driver1LicenseNumber"],
    driver1ExperieceYear: json["driver1ExperieceYear"],
    driver2Name: json["driver2Name"],
    driver2NamePhoneNumber: json["driver2NamePhoneNumber"],
    driver2LicenseNumber: json["driver2LicenseNumber"],
    driver2ExperieceYear: json["driver2ExperieceYear"],
    afterHoursContactDetails: json["AfterHoursContactDetails"],
    truckFullFueiledUpForTrip: json["truckFullFueiledUpForTrip"],
    gpsTruckFunctioning: json["GPSTruckFunctioning"],
    gpsTrailerFunctioning: json["GPSTrailerFunctioning"],
    padlockForThisRun: json["padlockForThisRun"],
    driverFitForDuty: json["driverFitForDuty"],
    weaterConcernFotThisTrip: json["weaterConcernFotThisTrip"],
    lastPtiReportForTruck: json["lastPTIReportForTruck"],
    lastPtiReportForTrailer: json["lastPTIReportForTrailer"],
    tripId: json["tripId"],
    statusText: json["statusText"],
    status: json["status"],
    createdOn: json["createdOn"],
    createdBy: json["createdBy"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "carrierName": carrierName,
    "BPEOrder": bpeOrder,
    "truckNumber": truckNumber,
    "truckMakingYear": truckMakingYear,
    "lastAnnualSafetyCheckDate": lastAnnualSafetyCheckDate,
    "lastPreventiveMaintenanceTruckDate": lastPreventiveMaintenanceTruckDate,
    "trailerNumber": trailerNumber,
    "trailerMakingYear": trailerMakingYear,
    "lastAnnualSafetyCheckDateTrailer": lastAnnualSafetyCheckDateTrailer,
    "driver1Name": driver1Name,
    "driver1NamePhoneNumber": driver1NamePhoneNumber,
    "driver1LicenseNumber": driver1LicenseNumber,
    "driver1ExperieceYear": driver1ExperieceYear,
    "driver2Name": driver2Name,
    "driver2NamePhoneNumber": driver2NamePhoneNumber,
    "driver2LicenseNumber": driver2LicenseNumber,
    "driver2ExperieceYear": driver2ExperieceYear,
    "AfterHoursContactDetails": afterHoursContactDetails,
    "truckFullFueiledUpForTrip": truckFullFueiledUpForTrip,
    "GPSTruckFunctioning": gpsTruckFunctioning,
    "GPSTrailerFunctioning": gpsTrailerFunctioning,
    "padlockForThisRun": padlockForThisRun,
    "driverFitForDuty": driverFitForDuty,
    "weaterConcernFotThisTrip": weaterConcernFotThisTrip,
    "lastPTIReportForTruck": lastPtiReportForTruck,
    "lastPTIReportForTrailer": lastPtiReportForTrailer,
    "tripId": tripId,
    "statusText": statusText,
    "status": status,
    "createdOn": createdOn,
    "createdBy": createdBy,
    "id": id,
  };
}
