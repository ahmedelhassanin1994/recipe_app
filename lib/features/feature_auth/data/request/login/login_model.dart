import 'package:json_annotation/json_annotation.dart';


class LoginModelRequest {
  String? mobile;
  String? password;

  LoginModelRequest({this.mobile, this.password});

  LoginModelRequest.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    return data;
  }
}
