class ViewRequestModel {
  List<Data>? data;
  String? dataCount;

  ViewRequestModel({this.data, this.dataCount});

  ViewRequestModel.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    dataCount = json['DataCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['DataCount'] = this.dataCount;
    return data;
  }
}

class Data {
  String? userName;
  int? conferenceRoomBookingCode;
  int? conferenceRoomCode;
  int? userCode;
  Null? notes;
  int? bookingStatus;
  int? bookingStatusOld;
  String? bookingDate;
  Null? locked;
  Null? companyCode;
  String? buildingShortCode;
  String? conferenceRoomName;
  String? conferenceRoomShortCode;
  int? locationFloor;
  int? peopleCapacity;
  String? statusText;
  String? slots;
  String? slotsPlainText;
  String? abc;
  String? createdOn;
  int? createdBy;
  int? rowNo;

  Data(
      {this.userName,
      this.conferenceRoomBookingCode,
      this.conferenceRoomCode,
      this.userCode,
      this.notes,
      this.bookingStatus,
      this.bookingStatusOld,
      this.bookingDate,
      this.locked,
      this.companyCode,
      this.buildingShortCode,
      this.conferenceRoomName,
      this.conferenceRoomShortCode,
      this.locationFloor,
      this.peopleCapacity,
      this.statusText,
      this.slots,
      this.slotsPlainText,
      this.abc,
      this.createdOn,
      this.createdBy,
      this.rowNo});

  Data.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    conferenceRoomBookingCode = json['conference_room_booking_code'];
    conferenceRoomCode = json['conference_room_code'];
    userCode = json['user_code'];
    notes = json['notes'];
    bookingStatus = json['booking_status'];
    bookingStatusOld = json['booking_status_old'];
    bookingDate = json['booking_date'];
    locked = json['locked'];
    companyCode = json['company_code'];
    buildingShortCode = json['building_short_code'];
    conferenceRoomName = json['conference_room_name'];
    conferenceRoomShortCode = json['conference_room_short_code'];
    locationFloor = json['location_floor'];
    peopleCapacity = json['people_capacity'];
    statusText = json['status_text'];
    slots = json['slots'];
    slotsPlainText = json['slots_plain_text'];
    abc = json['abc'];
    createdOn = json['created_on'];
    createdBy = json['created_by'];
    rowNo = json['Row_No'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['conference_room_booking_code'] = this.conferenceRoomBookingCode;
    data['conference_room_code'] = this.conferenceRoomCode;
    data['user_code'] = this.userCode;
    data['notes'] = this.notes;
    data['booking_status'] = this.bookingStatus;
    data['booking_status_old'] = this.bookingStatusOld;
    data['booking_date'] = this.bookingDate;
    data['locked'] = this.locked;
    data['company_code'] = this.companyCode;
    data['building_short_code'] = this.buildingShortCode;
    data['conference_room_name'] = this.conferenceRoomName;
    data['conference_room_short_code'] = this.conferenceRoomShortCode;
    data['location_floor'] = this.locationFloor;
    data['people_capacity'] = this.peopleCapacity;
    data['status_text'] = this.statusText;
    data['slots'] = this.slots;
    data['slots_plain_text'] = this.slotsPlainText;
    data['abc'] = this.abc;
    data['created_on'] = this.createdOn;
    data['created_by'] = this.createdBy;
    data['Row_No'] = this.rowNo;
    return data;
  }
}
