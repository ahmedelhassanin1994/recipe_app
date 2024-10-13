// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signـup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModelResponse _$RegisterModelResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterModelResponse(
      json['message'] as String?,
      (json['status'] as num?)?.toInt(),
      json['response'] == null
          ? null
          : Data_UserResponse.fromJson(
              json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterModelResponseToJson(
        RegisterModelResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'response': instance.response?.toJson(),
    };

Data_UserResponse _$Data_UserResponseFromJson(Map<String, dynamic> json) =>
    Data_UserResponse(
      json['name'] as String?,
      json['email'] as String?,
      json['mobile'] as String?,
      (json['id'] as num?)?.toInt(),
      json['token'] as String?,
      (json['user_code_active'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Data_UserResponseToJson(Data_UserResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'mobile': instance.mobile,
      'id': instance.id,
      'token': instance.token,
      'user_code_active': instance.user_code_active,
    };
