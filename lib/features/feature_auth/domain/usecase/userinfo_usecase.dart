import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/feature_auth/domain/entities/login_model.dart';

import '../repository/repository.dart';

class UserInfoUseCase implements BaseCase<InputUserInfoUseCase, ModelProfileUseCase> {
  final Repository _repository;

  UserInfoUseCase(this._repository);

  @override
  Future<Either<Failure, ModelProfileUseCase>> execute(InputUserInfoUseCase input) async {
    return await _repository.get_currentuserinfo(input.token.toString());
  }

}

class InputUserInfoUseCase{
  String? token;

  InputUserInfoUseCase({this.token});
}
