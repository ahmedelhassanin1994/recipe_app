
import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:mvvm_project/core/app_prefs.dart';
import 'package:mvvm_project/core/common/data/model/model_response.dart';
import 'package:mvvm_project/core/fixtures_reader.dart';
import 'package:mvvm_project/core/common/services/services.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/features/feature_auth/data/network/apiAuth.dart';
import 'package:mvvm_project/features/feature_auth/data/request/login/login_model.dart';
import 'package:mvvm_project/features/feature_auth/data/request/model_addAddress.dart';
import 'package:mvvm_project/features/feature_auth/data/request/register/request_register_model.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/login/login_model_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/model_address.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/profile_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/restpassword_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/sign_up/sign%D9%80up.dart';
import 'package:crypto/crypto.dart';

abstract class RemoteDataSourceAuth {

   Future<LoginModelResponse> register(RegisterModel registerModel);
   Future<LoginModelResponse> login(LoginModelRequest loginModel);
   // Future<UserCredential> signInWithGoogle();
   // Future<UserCredential> loginFB();
   // Future<UserCredential> loginApple();
   Future<ModelProfileResponse> get_currentuserinfo(String token);
   Future<ModelProfileResponse> Update_User_Profile(Map<String, dynamic> body);
   Future<LoginModelResponse> Apple_login(Map<String, dynamic> body);
   Future<ModelRestPassword> rest_password(Map<String, dynamic> body);
   Future<dynamic> delete_account(String Cookie);
   Future<Model_Address> getAddress(String token);
   Future<ModelResponse> Add_Address(String token,ModelAddaddressRequest model);


}

 class RemoteDataSourceAuthImplementer implements RemoteDataSourceAuth {
  final ApiAuth _appServiceClient;

  RemoteDataSourceAuthImplementer(this._appServiceClient);
  // RemoteDataSourceAuthImplementer.name(this._appServiceClient);

  @override
  Future<LoginModelResponse> register(RegisterModel registerModel) async{
    // TODO: implement register
    // final loginAuthResponse = LoginModelResponse.fromJson('login.json'.toFixture());
    //  return loginAuthResponse;
    return _appServiceClient.register(registerModel);

  }

  @override
  Future<LoginModelResponse> login(LoginModelRequest loginModel) async{
    // // TODO: implement login
    //  final loginAuthResponse = LoginModelResponse.fromJson('login.json'.toFixture());
    // //   print("loginAuthResponse : ${loginAuthResponse.toJson().toString()}");
    //  return loginAuthResponse;

     return await _appServiceClient.login(loginModel.toJson());

  }


  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<ModelProfileResponse> get_currentuserinfo(String token) async{
    // TODO: implement get_currentuserinfo

    return await _appServiceClient.get_currentuserinfo(token);
  }

  @override
  Future<ModelProfileResponse> Update_User_Profile(Map<String, dynamic> body) async{
    // TODO: implement Update_User_Profile
    // final profile = ModelProfileResponse.fromJson('profile.json'.toFixture());
    //
    // return profile;
  return _appServiceClient.Update_User_Profile(body);
  }

  @override
  Future<LoginModelResponse> Apple_login(Map<String, dynamic> body) async{
    // TODO: implement Apple_login
   return _appServiceClient.Apple_login(body);
  }

  @override
  Future<ModelRestPassword> rest_password(Map<String, dynamic> body) async{
    // TODO: implement rest_password
   return _appServiceClient.rest_password(body);
  }

  @override
  Future delete_account(String Cookie) async{
    // TODO: implement delete_account
   return _appServiceClient.delete_account(Cookie);
  }

  @override
  Future<Model_Address> getAddress(String token)async{
    // TODO: implement getAddress
    // List<Model_Address> slider_list=[];
    // final String response = await rootBundle.loadString('${JsonAssets.Address}');
    // final data = await json.decode(response);
    // final list= data.map((data) => Model_Address.fromJson(data)).toList();
    // for(Model_Address m in list){
    //   slider_list.add(m);
    // }
    // return slider_list;

    return await _appServiceClient.get_Address(token);
  }

  @override
  Future<ModelResponse> Add_Address(String token, ModelAddaddressRequest model) async{
    // TODO: implement Add_Address

    return await _appServiceClient.Add_Address(token, model.toJson());
  }
}
