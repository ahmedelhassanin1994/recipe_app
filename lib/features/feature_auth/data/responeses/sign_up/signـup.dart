


import 'package:json_annotation/json_annotation.dart';
part 'signـup.g.dart';



@JsonSerializable(explicitToJson: true)
class RegisterModelResponse {
  @JsonValue('message')
  String? message;
  @JsonValue('status')
  int? status;
  @JsonValue('data')
  Data_UserResponse? response;

  RegisterModelResponse(this.message, this.status, this.response);

factory RegisterModelResponse.fromJson(Map<String, dynamic> json) => _$RegisterModelResponseFromJson(json);
Map<String, dynamic> toJson() => _$RegisterModelResponseToJson(this);

}

@JsonSerializable()
class Data_UserResponse{

  @JsonValue('name')
  String? name;
  @JsonValue('email')
  String? email;
  @JsonValue('mobile')
  String? mobile;
  @JsonValue('id')
  int? id;
  @JsonValue('token')
  String? token;
  @JsonValue('user_code_active')
  int? user_code_active;

  Data_UserResponse(this.name, this.email, this.mobile, this.id, this.token,
      this.user_code_active);


  factory Data_UserResponse.fromJson(Map<String, dynamic> json) => _$Data_UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$Data_UserResponseToJson(this);
}


