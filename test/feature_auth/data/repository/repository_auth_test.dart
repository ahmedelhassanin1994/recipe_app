

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mvvm_project/core/fixtures_reader.dart';
import 'package:mvvm_project/core/common/data/data_source/local_data_source.dart';
import 'package:mvvm_project/core/common/data/mapper/mapper_product.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';
import 'package:mvvm_project/features/feature_auth/data/data_source/remote_data_source_auth.dart';
import 'package:mvvm_project/features/feature_auth/data/mapper/mapper.dart';
import 'package:mvvm_project/features/feature_auth/data/repository/repository_impl.dart';
import 'package:mvvm_project/features/feature_auth/data/request/login/login_model.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/login/login_model_response.dart';

import '../../../mocks.dart';

void main() {

  late RepositoryImpl repositoryImpl;
  late MokNetworkInfo networkInfo;
  late MokLocalDataSource localDataSource;
  late RemoteDataSourceAuthImplementer _remoteDataSource;
  late MockApiAuth apiAuth;
  final loginAuthResponse = LoginModelResponse.fromJson('login.json'.toFixture());
  final loginModelUseCase=loginAuthResponse.toDomain();

  setUp(() async{
    registerFallbackValue(Uri());
    apiAuth= MockApiAuth();
    localDataSource= MokLocalDataSource();
    _remoteDataSource = RemoteDataSourceAuthImplementer(apiAuth);
    networkInfo=MokNetworkInfo();
    repositoryImpl = RepositoryImpl(_remoteDataSource,networkInfo,localDataSource);

  });


  group('login', () {
    test(
      'should check if the device is online',
          () async {
      //  arrange
        when(
              () => apiAuth.login(LoginModelRequest(username: "ahmed2@gmail.com",password: "123456789")),
        ).thenAnswer(
              (_) async =>loginAuthResponse,
        );

        _remoteDataSource.login(LoginModelRequest(username: "ahmed2@gmail.com",password: "123456789"));
        when(() => networkInfo.isConnected).thenAnswer((_) async => true);

        //act
           repositoryImpl.login(LoginModelRequest(username: "ahmed2@gmail.com",password: "123456789"));
         // assert
        verify(() => networkInfo.isConnected);

      },
    );

    // test(
    //   'should return remote data when the call to remote data source is successful',
    //       () async {
    //     // arrange
    //     when(() => _remoteDataSource.login(LoginModelRequest(username: "ahmed2@gmail.com",password: "123456789")))
    //         .thenAnswer((_) async => loginAuthResponse);
    //
    //     // act
    //     final result = await repositoryImpl.login(LoginModelRequest(username: "ahmed2@gmail.com",password: "123456789"));
    //
    //     // assert
    //     verify(() => _remoteDataSource.login(LoginModelRequest(username: "ahmed2@gmail.com",password: "123456789")));
    //     expect(result, equals(Right(loginModelUseCase)));
    //   },
    // );



    });
}