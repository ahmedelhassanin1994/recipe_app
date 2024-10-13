
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/network/error_handler.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';
import 'package:mvvm_project/core/common/data/data_source/local_data_source.dart';
import 'package:mvvm_project/features/features_home/data/data_source/remote_data_source_home.dart';
import 'package:mvvm_project/features/features_home/data/mapper/mapper_home.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';


class RepositoryHomeImpl extends RepositoryHome {
  late RemoteDataSourceHome _remoteDataSource;
  late LocalDataSource localDataSource;
  late NetworkInfo _networkInfo;

  RepositoryHomeImpl(this._remoteDataSource, this._networkInfo, this.localDataSource);



  @override
  Future<Either<Failure,List<Recipe_Entities>>> getRecipe() async{
    // TODO: implement categories
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getRecipe();
        List<Recipe_Entities>? recipes=(response!.map((e) => e.toDomain()) ?? Iterable.empty()).cast<Recipe_Entities>().toList();
        return Right(recipes);

      } catch (e) {
        print("error : ${e.toString()}");
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NI_INTERNET_CONNECTION.getFailure());

  }

  }

}
