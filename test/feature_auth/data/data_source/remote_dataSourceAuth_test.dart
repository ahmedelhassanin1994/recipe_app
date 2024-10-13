

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/core/common/network/dio_factory.dart';
import 'package:mvvm_project/features/feature_auth/data/data_source/remote_data_source_auth.dart';
import 'package:mvvm_project/features/feature_auth/data/network/apiAuth.dart';
import 'package:mvvm_project/features/feature_auth/data/request/login/login_model.dart';
import 'package:mvvm_project/features/feature_auth/data/request/register/request_register_model.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/login/login_model_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/profile_response.dart';
import '../../../fixtures_reader.dart';
import 'package:dio/dio.dart';

import '../../../mocks.dart';

void main() {


    late RemoteDataSourceAuthImplementer remoteDataSourceAuth;
    late Dio mockDio;
    late MockApiAuth apiAuth;

    final loginAuthResponse = LoginModelResponse.fromJson('login.json'.toFixture());
    final profile = ModelProfileResponse.fromJson('profile.json'.toFixture());




    setUp(() async{
       apiAuth= MockApiAuth();
      remoteDataSourceAuth = RemoteDataSourceAuthImplementer(apiAuth);


    });
    group('login', () {
      test(
        'should perform a post request on /login sucess ',
            () async {
          // arrange

              when(
                () => apiAuth.login(LoginModelRequest(username: "ahmed2@gmail.com",password: "123456789")),
          ).thenAnswer(
                (_) async =>loginAuthResponse,
          );

          //act
           remoteDataSourceAuth.login(LoginModelRequest(username: "ahmed2@gmail.com",password: "123456789"));
          // // assert
          verifyNever(() => apiAuth.login(LoginModelRequest(username: "ahmed2@gmail.com",password: "123456789")));
          verifyNoMoreInteractions(apiAuth);
        },
      );


    });


    group('register', () {
      test(
        'should perform a post request on /register sucess ',
            () async {
          // arrange
          when(
                () => apiAuth.register(RegisterModel(userEmail:"ahmed@gmail.com",username: "ahmed2@gmail.com",userPass: "123456789")),
          ).thenAnswer(
                (_) async =>loginAuthResponse,
          );

          //act
          remoteDataSourceAuth.register(RegisterModel(userEmail:"ahmed@gmail.com",username: "ahmed2@gmail.com",userPass: "123456789"));

          // // assert
          verifyNever(() => apiAuth.register(RegisterModel(userEmail:"ahmed@gmail.com",username: "ahmed2@gmail.com",userPass: "123456789")));
          verifyNoMoreInteractions(apiAuth);


        },
      );


    });

    group('get_currentuserinfo', () {
      test(
        'should perform a post request on /get_currentuserinfo sucess ',
            () async {
          // arrange
          when(
                () => apiAuth.get_currentuserinfo(""),
          ).thenAnswer(
                (_) async =>profile,
          );

          //act
          remoteDataSourceAuth.get_currentuserinfo("");
          // // assert

          verifyNever(() => apiAuth.get_currentuserinfo(""));
          verifyNoMoreInteractions(apiAuth);
        },
      );


    });

    // group('Update_User_Profile', () {
    //   Map<String, dynamic> body={};
    //   test(
    //     'should perform a post request on /get_currentuserinfo sucess ',
    //         () async {
    //       // arrange
    //       when(
    //             () => apiAuth.Update_User_Profile(body)
    //       ).thenAnswer(
    //             (_) async =>profile,
    //       );
    //
    //       //act
    //       remoteDataSourceAuth.Update_User_Profile(body);
    //       // // assert
    //
    //       verifyNever(() => apiAuth.Update_User_Profile(body));
    //       verifyNoMoreInteractions(apiAuth);
    //     },
    //   );
    //
    //
    // });
}

