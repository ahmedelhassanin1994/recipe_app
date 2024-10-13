
import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/data/data_source/remote_data_source_googleapis.dart';
import 'package:mvvm_project/core/common/data/model/model_place.dart';
import 'package:mvvm_project/core/common/data/model/model_place_details.dart';
import 'package:mvvm_project/core/common/domain/repository/repository_googleapis.dart';
import 'package:mvvm_project/core/common/network/error_handler.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';


class RepositoryGoogleApisImpl extends RepositoryGoogleApis {
  late RemoteDataSourcPlace _remoteDataSource;
  late NetworkInfo _networkInfo;

  RepositoryGoogleApisImpl(this._remoteDataSource, this._networkInfo);



  @override
  Future<Either<Failure, Model_Place>> Autocomplete(String search) async{
    // TODO: implement Autocomplete
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.Autocomplete(search);
        return Right(response);

      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ModelPlaceDetails>> Autocomplete_details(String place_id) async{
    // TODO: implement Autocomplete_details
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.Autocomplete_details(place_id);
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());
    }
  }


}
