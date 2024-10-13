import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/data/model/model_response.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/feature_auth/data/request/login/login_model.dart';
import 'package:mvvm_project/features/feature_auth/data/request/model_addAddress.dart';
import 'package:mvvm_project/features/feature_auth/data/request/register/request_register_model.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/login/login_model_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/model_address.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/profile_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/restpassword_response.dart';
import 'package:mvvm_project/features/feature_auth/domain/entities/login_model.dart';


abstract class Repository {

   Future<Either<Failure, LoginModelUseCase>> register(RegisterModel registerModel);
   Future<Either<Failure, LoginModelUseCase>> login(LoginModelRequest loginModel);
   // Future<Either<Failure, UserCredential>> signInWithGoogle();
   // Future<Either<Failure, UserCredential>> loginFB();
   // Future<Either<Failure, UserCredential>> loginApple();
   Future<Either<Failure, ModelProfileUseCase>> get_currentuserinfo(String token);
   Future<Either<Failure, ModelProfileUseCase>> Update_User_Profile(Map<String, dynamic> body);
   Future<Either<Failure, ModelRestPassword>> rest_password(Map<String, dynamic> body);
   Future<Either<Failure, String>> delete_account(String Cookie);
   Future<Either<Failure, Model_Address>> getAddress(String token);
   Future<Either<Failure, ModelResponse>> AddAddress(String token,ModelAddaddressRequest model);


}
