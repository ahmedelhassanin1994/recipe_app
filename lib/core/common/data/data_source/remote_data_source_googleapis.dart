
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/core/common/data/model/model_place.dart';
import 'package:mvvm_project/core/common/data/model/model_place_details.dart';
import 'package:mvvm_project/core/common/data/network/api_place.dart';

abstract class RemoteDataSourcPlace {

   Future<Model_Place> Autocomplete(String search);
   Future<ModelPlaceDetails> Autocomplete_details(String place_id);



}

 class RemoteDataSourcePlaceImplementer implements RemoteDataSourcPlace {
  final ApiPlace _appServiceClient;

  RemoteDataSourcePlaceImplementer(this._appServiceClient);
  @override
  Future<Model_Place> Autocomplete(String search) {
    // TODO: implement stores
  return _appServiceClient.autocomplete( Constant.Sessiontoken, Constant.key, search);

  }

  @override
  Future<ModelPlaceDetails> Autocomplete_details(String place_id) {
    // TODO: implement autocomplete_details
   return _appServiceClient.autocomplete_details(place_id,"geometry", Constant.key, Constant.Sessiontoken,);
  }
}
