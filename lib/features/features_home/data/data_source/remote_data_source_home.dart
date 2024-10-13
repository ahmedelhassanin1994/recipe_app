
import 'dart:convert';

import 'package:mvvm_project/features/features_home/data/network/apiHome.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_recipe.dart';
import '../../../../core/constant.dart';
abstract class RemoteDataSourceHome {


   Future<List<ModelRecipeResponse>> getRecipe();

}

 class RemoteDataSourceHomeImplementer implements RemoteDataSourceHome {
  final ApiHome _appServiceClient;

  RemoteDataSourceHomeImplementer(this._appServiceClient);

  @override
  Future<List<ModelRecipeResponse>> getRecipe() async{
    return await _appServiceClient.getRecipe();
  }


}
