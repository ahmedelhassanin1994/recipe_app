import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/feature_auth/data/request/login/login_model.dart';
import 'package:mvvm_project/features/feature_auth/domain/entities/login_model.dart';

import '../repository/repository.dart';

class DeleteAccountUseCase implements BaseCase<InputDeleteAccountUseCase, String> {
  final Repository _repository;

  DeleteAccountUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(InputDeleteAccountUseCase input) async {
    return await _repository.delete_account(input.Cookie.toString());
  }

}

class InputDeleteAccountUseCase{
  String? Cookie;

  InputDeleteAccountUseCase(this.Cookie);
}
