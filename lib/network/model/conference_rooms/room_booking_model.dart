// To parse this JSON data, do
//
//     final roomBookingModel = roomBookingModelFromJson(jsonString);

import 'dart:convert';

RoomBookingModel roomBookingModelFromJson(String str) =>
    RoomBookingModel.fromJson(json.decode(str));

String roomBookingModelToJson(RoomBookingModel data) =>
    json.encode(data.toJson());

class RoomBookingModel {
  List<Datum> data;

  RoomBookingModel({
    required this.data,
  });

  factory RoomBookingModel.fromJson(Map<String, dynamic> json) =>
      RoomBookingModel(
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int conferenceRoomBookingCode;

  Datum({
    required this.conferenceRoomBookingCode,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        conferenceRoomBookingCode: json["conference_room_booking_code"],
      );

  Map<String, dynamic> toJson() => {
        "conference_room_booking_code": conferenceRoomBookingCode,
      };
}
