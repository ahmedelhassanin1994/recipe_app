import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/model_address.dart';
import 'package:mvvm_project/features/feature_auth/domain/entities/login_model.dart';

import '../repository/repository.dart';

class UserAddressUseCase implements BaseCase<InputUserAddressUseCase,Model_Address> {
  final Repository _repository;

  UserAddressUseCase(this._repository);

  @override
  Future<Either<Failure,Model_Address>> execute(InputUserAddressUseCase input) async {
    return await _repository.getAddress(input.token.toString());
  }
}

class InputUserAddressUseCase{
  String? token;
  InputUserAddressUseCase(this.token);
}
