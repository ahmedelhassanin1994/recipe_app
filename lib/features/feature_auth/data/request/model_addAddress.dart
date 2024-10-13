

class ModelAddaddressRequest {
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

  ModelAddaddressRequest(
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

  ModelAddaddressRequest.fromJson(Map<String, dynamic> json) {
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