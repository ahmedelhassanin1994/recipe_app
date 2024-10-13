//
//
// // to convert the response into an non nullable object (model)

import 'package:mvvm_project/core/common/extensions.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/login/login_model_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/profile_response.dart';
import 'package:mvvm_project/features/feature_auth/data/responeses/sign_up/sign%D9%80up.dart';
import 'package:mvvm_project/features/feature_auth/domain/entities/login_model.dart';
import 'package:mvvm_project/features/feature_auth/domain/entities/register_model.dart';

const EMPTY="";
const ZERO=2;
const STATUS=false;
const Double=0.0;


extension RegisterResponseMapper on RegisterModelResponse?{
  ReqisterModelUseCase toDomain(){

    return ReqisterModelUseCase(this?.message?.orEmpty(),this?.status?.orZero(),this?.response.toDomain());
  }
}

extension DataRegisterResponseMapper on Data_UserResponse?{
  DataRegister toDomain(){

    return DataRegister(this?.name?.orEmpty(),this?.email.orEmpty(),this?.mobile?.orEmpty(),this?.id?.orZero(),this?.token.orEmpty(),this?.user_code_active?.orZero(),);
  }
}


extension LoginResponseMapper on LoginModelResponse?{
  LoginModelUseCase toDomain(){
    print('login : ${this?.data?.token.orEmpty()}');
    return LoginModelUseCase(this?.data?.token.orEmpty());
  }
}


extension ModelProfileResponseMapper on ModelProfileResponse?{
  ModelProfileUseCase toDomain(){

    return ModelProfileUseCase(this?.user.toDomain());
  }
}

extension LoginDataUserResponseMapper on DataUser?{
  DataUserUsecase toDomain(){
    List<Shipping_UseCase>? shipping=(this?.shops!.map((e) => e.toDomain()) ?? Iterable.empty()).cast<Shipping_UseCase>().toList();

    return DataUserUsecase(id: this?.id?.toInt(),username: this?.name.orEmpty(),email: this?.email.orEmpty(),url: this?.picture.orEmpty(),firstname: this?.name.orEmpty(),
     avatar: this?.picture.toString(),shipping: shipping,
    );
  }
}





extension ShippingMapper on Shipping?{
  Shipping_UseCase toDomain(){
    // print("address : ${this?.address1?.toString().orEmpty()}");
    return Shipping_UseCase(id: this?.id.toString().orEmpty(),houseNum: this?.address?.houseNum.toString().orEmpty(),street:this?.address?.street.toString().orEmpty(),
      district: this?.address?.district.toString().orEmpty(),postcode: this?.address?.postcode.toString().orEmpty(),
      city: this?.address?.city.toString().orEmpty(),country: this?.address?.country.toString().orEmpty(),note: this?.address?.note.toString().orEmpty(),
      label: this?.address?.label.toString().orEmpty(),displayAddress: this?.address?.displayAddress.toString().orEmpty()
    );
  }



}






