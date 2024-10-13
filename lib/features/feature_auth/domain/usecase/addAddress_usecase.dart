import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/data/model/model_response.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/feature_auth/data/request/model_addAddress.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/model_address.dart';
import 'package:mvvm_project/features/feature_auth/domain/entities/login_model.dart';

import '../repository/repository.dart';

class UserAddAddressUseCase implements BaseCase<InputAddUserAddressUseCase,ModelResponse> {
  final Repository _repository;

  UserAddAddressUseCase(this._repository);

  @override
  Future<Either<Failure,ModelResponse>> execute(InputAddUserAddressUseCase input) async {
    ModelAddaddressRequest model=new ModelAddaddressRequest.fromJson(input.body);
    return await _repository.AddAddress(input.token.toString(),model);
  }
}

class InputAddUserAddressUseCase{
  String? token;
  dynamic body;
  InputAddUserAddressUseCase(this.token,this.body);
}
