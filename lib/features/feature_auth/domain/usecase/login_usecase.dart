import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/feature_auth/data/request/login/login_model.dart';
import 'package:mvvm_project/features/feature_auth/domain/entities/login_model.dart';

import '../repository/repository.dart';

class LoginUseCase implements BaseCase<InputLoginUseCase, LoginModelUseCase> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, LoginModelUseCase>> execute(InputLoginUseCase input) async {
    return await _repository.login(LoginModelRequest(mobile: input.username, password: input.password,));
  }

}

class InputLoginUseCase{
  String? username;
  String? password;

  InputLoginUseCase({this.username, this.password});
}
