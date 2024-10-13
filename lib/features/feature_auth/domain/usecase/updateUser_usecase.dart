import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/feature_auth/data/request/login/login_model.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/profile_response.dart';
import 'package:mvvm_project/features/feature_auth/domain/entities/login_model.dart';

import '../repository/repository.dart';

class UserUpdateUseCase implements BaseCase<InputUpdateUserUseCase, ModelProfileUseCase> {
  final Repository _repository;

  UserUpdateUseCase(this._repository);

  @override
  Future<Either<Failure, ModelProfileUseCase>> execute(InputUpdateUserUseCase input) async {
    return await _repository.Update_User_Profile(input.body);
  }

}

class InputUpdateUserUseCase{
  var body;

  InputUpdateUserUseCase({this.body});
}
