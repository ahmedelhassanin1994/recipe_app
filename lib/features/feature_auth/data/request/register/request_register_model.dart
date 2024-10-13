import 'package:json_annotation/json_annotation.dart';


class RegisterModel {
  String? mobile;
  String? name;
  String? role;
  String? password;

  RegisterModel({this.mobile, this.name, this.role, this.password});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    name = json['name'];
    role = json['role'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['role'] = this.role;
    data['password'] = this.password;
    return data;
  }
}
