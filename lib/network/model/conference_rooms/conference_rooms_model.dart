// To parse this JSON data, do
//
//     final conferenceRoomsModel = conferenceRoomsModelFromJson(jsonString);

import 'dart:convert';

class ConferenceRoomsModel {
  int value;
  String display;
  String? weekDays;
  int peopleCapacity;

  ConferenceRoomsModel({
    required this.value,
    required this.display,
    required this.weekDays,
    required this.peopleCapacity,
  });

  factory ConferenceRoomsModel.fromJson(Map<String, dynamic> json) =>
      ConferenceRoomsModel(
        value: json["value"],
        display: json["display"],
        weekDays: json["week_days"],
        peopleCapacity: json["people_capacity"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "display": display,
        "week_days": weekDays,
        "people_capacity": peopleCapacity,
      };
}
