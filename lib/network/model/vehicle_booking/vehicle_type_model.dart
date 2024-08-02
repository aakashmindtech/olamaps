// To parse this JSON data, do
//
//     final vehicleTypeModel = vehicleTypeModelFromJson(jsonString);

import 'dart:convert';

List<VehicleTypeModel> vehicleTypeModelFromJson(String str) =>
    List<VehicleTypeModel>.from(
        json.decode(str).map((x) => VehicleTypeModel.fromJson(x)));

String vehicleTypeModelToJson(List<VehicleTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehicleTypeModel {
  int value;
  String display;

  VehicleTypeModel({
    required this.value,
    required this.display,
  });

  factory VehicleTypeModel.fromJson(Map<String, dynamic> json) =>
      VehicleTypeModel(
        value: json["value"],
        display: json["display"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "display": display,
      };
}
