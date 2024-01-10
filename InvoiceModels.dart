// To parse this JSON data, do
//
//     final invoiceModels = invoiceModelsFromJson(jsonString);

import 'dart:convert';

InvoiceModels invoiceModelsFromJson(String str) => InvoiceModels.fromJson(json.decode(str));

String invoiceModelsToJson(InvoiceModels data) => json.encode(data.toJson());

class InvoiceModels {
  int? status;
  String? message;
  Result? result;

  InvoiceModels({
    this.status,
    this.message,
    this.result,
  });

  factory InvoiceModels.fromJson(Map<String, dynamic> json) => InvoiceModels(
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
  String? statusText;
  String? tripId;
  int? gsTtax;
  String? description;
  int? quantity;
  int? unitPrice;
  int? amount;
  int? status;
  String? createdOn;
  String? createdBy;
  String? invoiceNo;
  String? id;

  ResultElement({
    this.statusText,
    this.tripId,
    this.gsTtax,
    this.description,
    this.quantity,
    this.unitPrice,
    this.amount,
    this.status,
    this.createdOn,
    this.createdBy,
    this.invoiceNo,
    this.id,
  });

  factory ResultElement.fromJson(Map<String, dynamic> json) => ResultElement(
    statusText: json["statusText"],
    tripId: json["tripId"],
    gsTtax: json["GSTtax"],
    description: json["description"],
    quantity: json["quantity"],
    unitPrice: json["unitPrice"],
    amount: json["amount"],
    status: json["status"],
    createdOn: json["createdOn"],
    createdBy: json["createdBy"],
    invoiceNo: json["invoiceNo"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "statusText": statusText,
    "tripId": tripId,
    "GSTtax": gsTtax,
    "description": description,
    "quantity": quantity,
    "unitPrice": unitPrice,
    "amount": amount,
    "status": status,
    "createdOn": createdOn,
    "createdBy": createdBy,
    "invoiceNo": invoiceNo,
    "id": id,
  };
}
