class GetVehicleModel {
  List<Data>? data;
  String? filePath;

  GetVehicleModel({this.data, this.filePath});

  GetVehicleModel.fromJson(json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['file_path'] = this.filePath;
    return data;
  }
}

class Data {
  int? vehicleCode;
  String? registrationNo;
  int? vehicleTypeCode;
  int? permitTypeCode;
  int? vehicleCompanyCode;
  String? modelName;
  int? companyCode;
  bool? locked;
  int? createdBy;
  String? createdOn;
  int? lastUpdatedBy;
  String? lastUpdatedOn;
  Null? isDelete;
  String? vehicleTypeName;
  String? vehicleCompany;
  String? permitTypeName;
  String? vehicalImage;

  Data(
      {this.vehicleCode,
      this.registrationNo,
      this.vehicleTypeCode,
      this.permitTypeCode,
      this.vehicleCompanyCode,
      this.modelName,
      this.companyCode,
      this.locked,
      this.createdBy,
      this.createdOn,
      this.lastUpdatedBy,
      this.lastUpdatedOn,
      this.isDelete,
      this.vehicleTypeName,
      this.vehicleCompany,
      this.permitTypeName,
      this.vehicalImage});

  Data.fromJson(Map<String, dynamic> json) {
    vehicleCode = json['vehicle_code'];
    registrationNo = json['registration_no'];
    vehicleTypeCode = json['vehicle_type_code'];
    permitTypeCode = json['permit_type_code'];
    vehicleCompanyCode = json['vehicle_company_code'];
    modelName = json['model_name'];
    companyCode = json['company_code'];
    locked = json['locked'];
    createdBy = json['created_by'];
    createdOn = json['created_on'];
    lastUpdatedBy = json['last_updated_by'];
    lastUpdatedOn = json['last_updated_on'];
    isDelete = json['is_delete'];
    vehicleTypeName = json['vehicle_type_name'];
    vehicleCompany = json['vehicle_company'];
    permitTypeName = json['permit_type_name'];
    vehicalImage = json['vehical_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicle_code'] = this.vehicleCode;
    data['registration_no'] = this.registrationNo;
    data['vehicle_type_code'] = this.vehicleTypeCode;
    data['permit_type_code'] = this.permitTypeCode;
    data['vehicle_company_code'] = this.vehicleCompanyCode;
    data['model_name'] = this.modelName;
    data['company_code'] = this.companyCode;
    data['locked'] = this.locked;
    data['created_by'] = this.createdBy;
    data['created_on'] = this.createdOn;
    data['last_updated_by'] = this.lastUpdatedBy;
    data['last_updated_on'] = this.lastUpdatedOn;
    data['is_delete'] = this.isDelete;
    data['vehicle_type_name'] = this.vehicleTypeName;
    data['vehicle_company'] = this.vehicleCompany;
    data['permit_type_name'] = this.permitTypeName;
    data['vehical_image'] = this.vehicalImage;
    return data;
  }
}
