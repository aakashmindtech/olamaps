class VehicleBrandModel {
  int? value;
  String? display;

  VehicleBrandModel({this.value, this.display});

  VehicleBrandModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    display = json['display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['display'] = display;
    return data;
  }
}
