
import 'package:dio/dio.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_recipe.dart';
import 'package:retrofit/retrofit.dart';

part 'apiHome.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class ApiHome {
  factory ApiHome(Dio dio, {String baseUrl}) = _ApiHome;


  @GET("43427003d33f1f6b51cc")
  Future<List<ModelRecipeResponse>> getRecipe();
}
