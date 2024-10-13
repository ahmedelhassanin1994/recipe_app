import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mvvm_project/features/feature_auth/data/data_source/remote_data_source_auth.dart';
import 'package:mvvm_project/features/feature_auth/data/network/apiAuth.dart';
import 'package:mvvm_project/features/feature_auth/data/request/login/login_model.dart';
import 'package:mvvm_project/features/feature_auth/data/request/register/request_register_model.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/login/login_model_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/profile_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/restpassword_response.dart';
import 'package:dio/dio.dart';

import '../../../fixtures_reader.dart';
import '../../../mocks.dart';


void main() {

  final loginAuthResponse = LoginModelResponse.fromJson('login.json'.toFixture());
  final user = ModelProfileResponse.fromJson('profile.json'.toFixture());
  final restPasswordResponse =ModelRestPassword.fromJson({"status":"success"});

  late MockApiAuth mockApiAuth;
  late RemoteDataSourceAuthImplementer dataSource;

  setUp(() async {
    registerFallbackValue(Uri());
    mockApiAuth = MockApiAuth();
    dataSource = RemoteDataSourceAuthImplementer(mockApiAuth);

  });
  group('ApiAuth Login', () {


    test('Login should return a LoginModelResponse', () async {

      // Set up the behavior of the mock
      // arrange
      when(
            () => mockApiAuth.login(any()),
      ).thenAnswer(
            (_) async => loginAuthResponse,
      );
      // Call the method you want to test
      final response = await mockApiAuth.login(LoginModelRequest(username: "ahmed2@gmail.com",password: "123456789"));

      // Verify that the method was called with the correct parameters
      verify(() => mockApiAuth.login(any()));
      
      // act
      dataSource.login(LoginModelRequest(username: "ahmed2@gmail.com",password: "123456789"));

      // assert

      expect(response, isA<LoginModelResponse>());
    });

    test(
      'should return loginAuthResponse when the response is 200 (success)',
          () async {
        // arrange
        when(
              () => mockApiAuth.login(LoginModelRequest(username: "ahmed2@gmail.com",password: "123456789")),
        ).thenAnswer(
              (_) async => loginAuthResponse,
        );
        // act
        final response = await dataSource.login(LoginModelRequest(username: "ahmed2@gmail.com",password: "123456789"));

        // assert
        expect(response.toJson().toString(), loginAuthResponse.toJson().toString());
      },
    );


    // test(
    //   'should throw a ServerException when the response code is 404 or other (unsuccess)',
    //       () async {
    //     // arrange
    //     when(() => mockApiAuth.login(LoginModelRequest(username: "ahmed2@gmail.com",password: ""))).thenThrow(
    //       DioError(
    //         response: Response(
    //           data: 'Something went wrong',
    //           statusCode: 404,
    //           requestOptions: RequestOptions(path: ''),
    //         ),
    //         requestOptions: RequestOptions(path: ''),
    //       ),
    //     );
    //     // act
    //     final call = dataSource.login;
    //     // assert
    //     expect(
    //           () => call,
    //       throwsA(const TypeMatcher<DioExceptionType>()),
    //     );
    //   },
    // );

  });



  group('ApiAuth Reg', () {


    test('Reg should return a LoginModelResponse', () async {

      // Set up the behavior of the mock
      // arrange
      when(
            () => mockApiAuth.register(any()),
      ).thenAnswer(
            (_) async => loginAuthResponse,
      );
      // Call the method you want to test
      final response = await mockApiAuth.register(RegisterModel(username: "ahmed",userPass: "123456789",userNicename: "elhassanin",userEmail: "ahmed@gmail.com",userLogin: "ahmedelhassanin"));

      // Verify that the method was called with the correct parameters
      verify(() => mockApiAuth.register(any()));

      // act
      dataSource.register(RegisterModel(username: "ahmed",userPass: "123456789",userNicename: "elhassanin",userEmail: "ahmed@gmail.com",userLogin: "ahmedelhassanin"));

      // assert

      expect(response, isA<LoginModelResponse>());
    });

    test(
      'should return RegAuthResponse when the response is 200 (success)',
          () async {
        // arrange
        when(
              () => mockApiAuth.register(RegisterModel(username: "ahmed",userPass: "123456789",userNicename: "elhassanin",userEmail: "ahmed@gmail.com",userLogin: "ahmedelhassanin")),
        ).thenAnswer(
              (_) async => loginAuthResponse,
        );
        // act
        final response = await dataSource.register(RegisterModel(username: "ahmed",userPass: "123456789",userNicename: "elhassanin",userEmail: "ahmed@gmail.com",userLogin: "ahmedelhassanin"));

        // assert
        expect(response.toJson().toString(), loginAuthResponse.toJson().toString());
      },
    );




  });

  group('ApiAuth get user Info', () {


    test('get current user info should return a LoginModelResponse', () async {

      // Set up the behavior of the mock
      // arrange
      when(
            () => mockApiAuth.get_currentuserinfo(any()),
      ).thenAnswer(
            (_) async => user,
      );
      // Call the method you want to test
      final response = await mockApiAuth.get_currentuserinfo("ahmed%7C1732614838%7CiahuWOzmwwhTbisL76ChqaAUxZTN5HztCTGFd7QiaMa%7Cd3d10c4b7f03bb176de37ba735527af311a4d11959a9c2d80f9e233af70ead41");

      // Verify that the method was called with the correct parameters
      verify(() => mockApiAuth.get_currentuserinfo(any()));

      // act
      dataSource.get_currentuserinfo("ahmed%7C1732614838%7CiahuWOzmwwhTbisL76ChqaAUxZTN5HztCTGFd7QiaMa%7Cd3d10c4b7f03bb176de37ba735527af311a4d11959a9c2d80f9e233af70ead41");

      // assert

      expect(response, isA<ModelProfileResponse>());
    });


    test(
      'should return user Info when the response is 200 (success)',
          () async {
        // arrange
        when(
              () => mockApiAuth.get_currentuserinfo("ahmed%7C1732614838%7CiahuWOzmwwhTbisL76ChqaAUxZTN5HztCTGFd7QiaMa%7Cd3d10c4b7f03bb176de37ba735527af311a4d11959a9c2d80f9e233af70ead41"),
        ).thenAnswer(
              (_) async => user,
        );
        // act
        final response = await dataSource.get_currentuserinfo("ahmed%7C1732614838%7CiahuWOzmwwhTbisL76ChqaAUxZTN5HztCTGFd7QiaMa%7Cd3d10c4b7f03bb176de37ba735527af311a4d11959a9c2d80f9e233af70ead41");

        // assert
        expect(response.toJson().toString(), user.toJson().toString());
      },
    );


  });



  group('ApiAuth rest password', () {


    test('rest password', () async {

      // Set up the behavior of the mock
      // arrange
      when(
            () => mockApiAuth.rest_password(any()),
      ).thenAnswer(
            (_) async => restPasswordResponse,
      );
      // Call the method you want to test
      final response = await mockApiAuth.rest_password({"user_login":" ahmed@gmail.com"});

      // Verify that the method was called with the correct parameters
      verify(() => mockApiAuth.rest_password(any()));

      // act
      dataSource.rest_password({"user_login":" ahmed@gmail.com"});

      // assert

      expect(response, isA<ModelRestPassword>());
    });


    test(
      'should return rest password when the response is 200 (success)',
          () async {
        // arrange
        when(
              () => mockApiAuth.rest_password({"user_login":" ahmed@gmail.com"}),
        ).thenAnswer(
              (_) async => restPasswordResponse,
        );

        // act
        final response = await dataSource.rest_password({"user_login":" ahmed@gmail.com"});

        // assert
        expect(response.toJson().toString(), restPasswordResponse.toJson().toString());
      },
    );


  });

}
