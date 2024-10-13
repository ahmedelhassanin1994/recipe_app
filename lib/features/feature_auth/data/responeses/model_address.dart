

import 'package:mvvm_project/features/feature_auth/data/responeses/profile_response.dart';

class Model_Address {
  bool? success;
  List<Address>? data;
  String? message;
  String? code;

  Model_Address({this.success, this.data, this.message, this.code});

  Model_Address.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Address>[];
      json['data'].forEach((v) {
        data!.add(new Address.fromJson(v));
      });
    }
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v).toList();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}
