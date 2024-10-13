import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/feature_auth/data/request/register/request_register_model.dart';
import 'package:mvvm_project/features/feature_auth/domain/entities/login_model.dart';
import '../repository/repository.dart';

class RegisterUseCase implements BaseCase<InputRegisterUseCase, LoginModelUseCase> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, LoginModelUseCase>> execute(InputRegisterUseCase input) async {
    return await _repository.register(RegisterModel(mobile: input.mobile.toString(),name: input.name.toString(),role: input.role.toString(),password: input.password.toString()));
  }
}

class InputRegisterUseCase{
  String? mobile;
  String? name;
  String? role;
  String? password;

  InputRegisterUseCase({
    this.mobile, this.name, this.role, this.password
  });
}
