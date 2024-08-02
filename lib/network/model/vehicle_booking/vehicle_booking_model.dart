class VehicleBookingModel {
  List<Data>? data;

  VehicleBookingModel({this.data});

  VehicleBookingModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? vehicleBookingCode;

  Data({this.vehicleBookingCode});

  Data.fromJson(Map<String, dynamic> json) {
    vehicleBookingCode = json['vehicle_booking_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicle_booking_code'] = this.vehicleBookingCode;
    return data;
  }
}
