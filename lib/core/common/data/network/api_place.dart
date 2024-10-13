import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/core/common/data/model/model_place.dart';
import 'package:mvvm_project/core/common/data/model/model_place_details.dart';
import 'package:retrofit/retrofit.dart';


part 'api_place.g.dart';

@RestApi(baseUrl: Constant.baseUrl_googleapis)
abstract class ApiPlace {
  factory ApiPlace(Dio dio, {String baseUrl}) = _ApiPlace;


  @GET("maps/api/place/autocomplete/json")
  Future<Model_Place> autocomplete(
      @Query("sessiontoken") String sessiontoken,
      @Query("key") String key,
      @Query("input") String input);


  @GET("maps/api/place/details/json")
  Future<ModelPlaceDetails> autocomplete_details(
      @Query("place_id") String place_id,
      @Query("fields") String fields,
      @Query("key") String key,
      @Query("sessiontoken") String sessiontoken
      );

}
