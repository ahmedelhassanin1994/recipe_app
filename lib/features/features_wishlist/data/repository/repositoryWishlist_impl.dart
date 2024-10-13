

import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/network/error_handler.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';
import 'package:mvvm_project/features/features_wishlist/data/data_source/localDataSource_wishlist.dart';
import 'package:mvvm_project/features/features_wishlist/domain/repository/repository_wishlist.dart';

import '../../../../core/common/data/data_source/local_data_source.dart';

class RepositoryWishlistImpl extends RepositoryWishlist {


  late LocalDataSourceWishlist localDataSource;


  RepositoryWishlistImpl(this.localDataSource);

  @override
  Future<void> AddWishlist(Recipe_Entities modelProductWishlist) async{
    // TODO: implement AddWishlist
  try{
    await localDataSource.AddWishlist(modelProductWishlist);
  }catch(e){
    print("error add : $e");
  }
  }

  @override
  Future<void> deleteAllWithlist() async{
    // TODO: implement deleteAllWithlist
   await localDataSource.deleteAllWithlist();
  }

  @override
  Future<void> deleteProduct(String id) async{
    // TODO: implement deleteProduct
    await localDataSource.deleteProduct(id);

  }

  @override
  Future<Either<Failure, List<Recipe_Entities>>> getCacheWishlist() async{
    // TODO: implement getCacheWishlist
    try{
      final data = await localDataSource.getCacheWishlist();
      return Right(data);
    }catch(e){
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>>IsProducWishlistt(String id) async{
    // TODO: implement IsProducWishlistt
    try{
      final data =await localDataSource.IsProducWishlistt(id);
      return Right(data);
    }catch(e){
      return Left(ErrorHandler.handle(e).failure);
    }
  }


}