// To parse this JSON data, do
//
//     final utilitiesModel = utilitiesModelFromJson(jsonString);

import 'dart:convert';

List<UtilitiesModel> utilitiesModelFromJson(String str) =>
    List<UtilitiesModel>.from(
        json.decode(str).map((x) => UtilitiesModel.fromJson(x)));

String utilitiesModelToJson(List<UtilitiesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UtilitiesModel {
  int value;
  String display;

  UtilitiesModel({
    required this.value,
    required this.display,
  });

  factory UtilitiesModel.fromJson(Map<String, dynamic> json) => UtilitiesModel(
        value: json["value"],
        display: json["display"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "display": display,
      };
}
