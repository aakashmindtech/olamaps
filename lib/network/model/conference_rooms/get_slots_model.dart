import 'dart:convert';

GetSlotsModel getSlotsModelFromJson(String str) =>
    GetSlotsModel.fromJson(json.decode(str));

String getSlotsModelToJson(GetSlotsModel data) => json.encode(data.toJson());

class GetSlotsModel {
  List<Datum> data;

  GetSlotsModel({
    required this.data,
  });

  factory GetSlotsModel.fromJson(Map<String, dynamic> json) => GetSlotsModel(
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  DateTime? bookingDate;
  String color;

  Datum({
    required this.bookingDate,
    required this.color,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        bookingDate: json["booking_date"] == null
            ? null
            : DateTime.parse(json["booking_date"]),
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "booking_date": bookingDate?.toIso8601String(),
        "color": color,
      };
}
