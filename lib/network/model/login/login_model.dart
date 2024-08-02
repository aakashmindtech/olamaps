// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  List<Datum> data;

  LoginModel({
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int userCode;
  String userName;
  String password;
  int sessionCode;
  int finYearCode;
  int locationCode;
  String token;

  Datum({
    required this.userCode,
    required this.userName,
    required this.password,
    required this.sessionCode,
    required this.finYearCode,
    required this.locationCode,
    required this.token,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userCode: json["UserCode"],
        userName: json["UserName"],
        password: json["Password"],
        sessionCode: json["SessionCode"],
        finYearCode: json["FinYearCode"],
        locationCode: json["LocationCode"],
        token: json["Token"],
      );

  Map<String, dynamic> toJson() => {
        "UserCode": userCode,
        "UserName": userName,
        "Password": password,
        "SessionCode": sessionCode,
        "FinYearCode": finYearCode,
        "LocationCode": locationCode,
        "Token": token,
      };
}
