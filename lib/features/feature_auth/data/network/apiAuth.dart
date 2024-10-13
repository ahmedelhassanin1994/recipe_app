import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mvvm_project/core/common/data/model/model_response.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/feature_auth/data/request/login/login_model.dart';
import 'package:mvvm_project/features/feature_auth/data/request/register/request_register_model.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/login/login_model_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/model_address.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/profile_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/restpassword_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'apiAuth.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class ApiAuth {
  factory ApiAuth(Dio dio, {String baseUrl}) = _ApiAuth;


  @POST("auth/register")
  Future<LoginModelResponse> register(@Body() RegisterModel? registerModel);

  @POST("auth/login")
  Future<LoginModelResponse> login(@Body()  Map<String, dynamic> body);

  @GET("users/profile")
  Future<ModelProfileResponse> get_currentuserinfo(@Header("Authorization") String token);

  @POST("users/profile")
  Future<ModelProfileResponse> Update_User_Profile(
      @Body() Map<String, dynamic> body);

  @GET("addresses")
  Future<Model_Address> get_Address(@Header("Authorization") String token);

  @POST("addresses")
  Future<ModelResponse> Add_Address(@Header("Authorization") String token,@Body()  Map<String, dynamic> body);


  @POST("wp-json/api/flutter_user/apple_login")
  Future<LoginModelResponse> Apple_login(@Body() Map<String, dynamic> body);

  @POST("wp-json/api/flutter_user/reset-password")
  Future<ModelRestPassword> rest_password(@Body() Map<String, dynamic> body);

  @DELETE("wp-json/api/flutter_user/delete_account")
  Future<dynamic> delete_account(@Header("User-Cookie") String Cookie);

}
