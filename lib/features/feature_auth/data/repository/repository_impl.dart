
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mvvm_project/core/common/data/model/model_response.dart';
import 'package:mvvm_project/core/common/network/error_handler.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';
import 'package:mvvm_project/core/common/data/data_source/local_data_source.dart';
import 'package:mvvm_project/features/feature_auth/data/data_source/remote_data_source_auth.dart';
import 'package:mvvm_project/features/feature_auth/data/mapper/mapper.dart';
import 'package:mvvm_project/features/feature_auth/data/request/login/login_model.dart';
import 'package:mvvm_project/features/feature_auth/data/request/model_addAddress.dart';
import 'package:mvvm_project/features/feature_auth/data/request/register/request_register_model.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/login/login_model_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/model_address.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/profile_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/restpassword_response.dart';
import 'package:mvvm_project/features/feature_auth/domain/repository/repository.dart';

import '../../domain/entities/login_model.dart';

class RepositoryImpl extends Repository {
  late RemoteDataSourceAuth _remoteDataSource;
  late LocalDataSource localDataSource;
  late NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo, this.localDataSource);


  @override
  Future<Either<Failure, LoginModelUseCase>> register(RegisterModel registerModel) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.register(registerModel);
          return Right(response.toDomain());
      } catch (e) {
        if (e is DioError && e.type == DioErrorType.badResponse) {
          return Left(Failure(ResponseCode.BAD_REQUEST, Failure.fromJson(e.response?.data).message));

        }else{
          return Left(Failure(ResponseCode.BAD_REQUEST, ResponseMessage.UNKNOWN));
        }
      }
    } else {
      return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, LoginModelUseCase>> login(loginModel) async{
    // TODO: implement login
    if (await _networkInfo.isConnected) {

      try {
        final response = await _remoteDataSource.login(loginModel);
        return Right(response.toDomain());
      } catch (e) {

        if (e is DioError && e.type == DioErrorType.badResponse) {
          return Left(Failure(e.response?.statusCode ?? ResponseCode.BAD_REQUEST, Failure.fromJson(e.response!.data).message ?? ""));

        }else{
          return Left(Failure(ResponseCode.BAD_REQUEST, ResponseMessage.UNKNOWN));
        }
      }
    } else {
      return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
    }
  }

  // @override
  // Future<Either<Failure, UserCredential>> loginApple() async{
  //   // TODO: implement loginApple
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       final response = await _remoteDataSource.loginApple();
  //       if (response.credential?.accessToken != null) {
  //         return Right(response);
  //       } else {
  //
  //         return Left(Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN));
  //       }
  //     } catch (e) {
  //       return Left(ErrorHandler.handle(e).failure);
  //     }
  //   } else {
  //     return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, UserCredential>> loginFB() async{
  //   // TODO: implement loginFB
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       final response = await _remoteDataSource.loginFB();
  //       if (response.credential?.accessToken != null) {
  //         return Right(response);
  //       } else {
  //
  //         return Left(Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN));
  //       }
  //     } catch (e) {
  //       return Left(ErrorHandler.handle(e).failure);
  //     }
  //   } else {
  //     return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, UserCredential>> signInWithGoogle() async{
  //   // TODO: implement signInWithGoogle
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       final response = await _remoteDataSource.signInWithGoogle();
  //       if (response.credential?.accessToken != null) {
  //         return Right(response);
  //       } else {
  //
  //         return Left(Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN));
  //       }
  //     } catch (e) {
  //       return Left(ErrorHandler.handle(e).failure);
  //     }
  //   } else {
  //     return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
  //   }
  // }

  @override
  Future<Either<Failure, ModelProfileUseCase>> get_currentuserinfo(String token) async{
    // TODO: implement get_currentuserinfo
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.get_currentuserinfo(token);

        return Right(response.toDomain());
      } catch (e) {
        print("error : ${e.toString()}");
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ModelProfileUseCase>> Update_User_Profile(Map<String, dynamic> body) async{
    // TODO: implement Update_User_Profile
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.Update_User_Profile(body);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
    }
  }

  // @override
  // Future<Either<Failure, LoginModelUseCase>> Apple_loginJWT() async{
  //   // TODO: implement Apple_login
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       final response = await _remoteDataSource.loginApple();
  //       if (response.credential?.accessToken != null) {
  //         var data={
  //           "token": "${response.credential?.accessToken}"
  //         };
  //         final userInfo = await _remoteDataSource.Apple_login(data);
  //         return Right(userInfo.toDomain());
  //       } else {
  //
  //         return Left(Failure(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN));
  //       }
  //
  //     } catch (e) {
  //       return Left(ErrorHandler.handle(e).failure);
  //     }
  //   } else {
  //     return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
  //   }
  // }

  @override
  Future<Either<Failure, ModelRestPassword>> rest_password(Map<String, dynamic> body) async{
    // TODO: implement rest_password
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.rest_password(body);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> delete_account(String Cookie) async{

    // TODO: implement delete_account
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.delete_account(Cookie);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, LoginModelUseCase>> Apple_loginJWT() {
    // TODO: implement Apple_loginJWT
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Model_Address>> getAddress(String token) async{
    // TODO: implement getAddress
    // TODO: implement delete_account
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getAddress(token);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ModelResponse>> AddAddress(String token, ModelAddaddressRequest model) async{
    // TODO: implement AddAddress
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.Add_Address(token,model);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
    }
  }


}
