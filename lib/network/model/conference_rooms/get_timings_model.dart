// To parse this JSON data, do
//
//     final timingsModel = timingsModelFromJson(jsonString);

class TimingsModel {
  int value;
  String display;
  bool checked;
  int markAsBook;

  TimingsModel({
    required this.value,
    required this.display,
    required this.checked,
    required this.markAsBook,
  });

  factory TimingsModel.fromJson(json) => TimingsModel(
        value: json["value"],
        display: json["display"],
        checked: json["checked"],
        markAsBook: json["mark_as_book"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "display": display,
        "checked": checked,
        "mark_as_book": markAsBook,
      };
}
