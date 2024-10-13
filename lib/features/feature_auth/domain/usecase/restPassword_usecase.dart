import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/feature_auth/data/request/login/login_model.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/profile_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/restpassword_response.dart';
import 'package:mvvm_project/features/feature_auth/domain/entities/login_model.dart';

import '../repository/repository.dart';

class RestPasswordUseCase implements BaseCase<InputRestPasswordUseCase, ModelRestPassword> {
  final Repository _repository;

  RestPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, ModelRestPassword>> execute(InputRestPasswordUseCase input) async {
    return await _repository.rest_password(input.body);
  }

}

class InputRestPasswordUseCase{
  var body;

  InputRestPasswordUseCase(this.body);
}
