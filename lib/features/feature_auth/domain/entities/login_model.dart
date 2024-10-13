
class LoginModelUseCase{

  String? token;

  LoginModelUseCase(this.token);
}



class DataUserUsecase{

  int? id;
  String? username;
  String? nicename;
  String? email;
  String? url;
  String? firstname;
  String? avatar;
  List<Shipping_UseCase>? shipping=[];

  DataUserUsecase({
      this.id,
      this.username,
      this.nicename,
      this.email,
      this.url,
      this.firstname,
      this.avatar,
      this.shipping
      });
}


class Shipping_UseCase {

  String? id;
  String? houseNum;
  String? street;
  String? district;
  String? postcode;
  String? city;
  String? country;
  String? note;
  String? label;
  String? displayAddress;

  Shipping_UseCase({
      this.id,
      this.houseNum,
      this.street,
      this.district,
      this.postcode,
      this.city,
      this.country,
      this.note,
      this.label,
      this.displayAddress});
}


class ModelProfileUseCase{
  DataUserUsecase? user;

  ModelProfileUseCase(this.user);
}