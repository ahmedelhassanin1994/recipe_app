



class ModelProfileResponse {
  DataUser? user;
  String? message;
  String? code;
  bool? success;


  ModelProfileResponse({this.user,this.message,this.code,this.success});

  ModelProfileResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    user = json['data'] != null ? new DataUser.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['data'] = this.user;
    }
    data['success'] = this.success;
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }

}


class DataUser {
  int? id;
  String? email;
  String? mobile;
  String? name;
  String? birthdate;
  String? picture;
  bool? verified;
  List<Shipping>? shops;

  DataUser(
      {this.id,
        this.email,
        this.mobile,
        this.name,
        this.birthdate,
        this.picture,
        this.verified,
        this.shops});

  DataUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    mobile = json['mobile'];
    name = json['name'];
    birthdate = json['birthdate'];
    picture = json['picture'];
    verified = json['verified'];
    if (json['shops'] != null) {
      shops = <Shipping>[];
      json['shops'].forEach((v) {
        shops!.add(new Shipping.fromJson(v));
      });
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['email'] = this.email;
      data['mobile'] = this.mobile;
      data['name'] = this.name;
      data['birthdate'] = this.birthdate;
      data['picture'] = this.picture;
      data['verified'] = this.verified;
      if (this.shops != null) {
        data['shops'] = this.shops!.map((v) => v.toJson()).toList();
      }
      return data;
    }
  }}

class Shipping {
  int? id;
  String? name;
  String? image;
  Address? address;


  Shipping(this.id, this.name, this.image, this.address);

  Shipping.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
  }
class Address {
  int? id;
  String? houseNum;
  String? street;
  String? district;
  String? postcode;
  String? city;
  String? country;
  String? note;
  String? label;
  String? displayAddress;

  Address(
      {this.id,
        this.houseNum,
        this.street,
        this.district,
        this.postcode,
        this.city,
        this.country,
        this.note,
        this.label,
        this.displayAddress});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    houseNum = json['houseNum'];
    street = json['street'];
    district = json['district'];
    postcode = json['postcode'];
    city = json['city'];
    country = json['country'];
    note = json['note'];
    label = json['label'];
    displayAddress = json['displayAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['houseNum'] = this.houseNum;
    data['street'] = this.street;
    data['district'] = this.district;
    data['postcode'] = this.postcode;
    data['city'] = this.city;
    data['country'] = this.country;
    data['note'] = this.note;
    data['label'] = this.label;
    data['displayAddress'] = this.displayAddress;
    return data;
  }
}