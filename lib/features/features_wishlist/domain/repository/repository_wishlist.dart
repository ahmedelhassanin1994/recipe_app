import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';


abstract class RepositoryWishlist {

   Future<Either<Failure, List<Recipe_Entities>>> getCacheWishlist();
   Future<void> AddWishlist(Recipe_Entities modelProductWishlist);
   Future<void> deleteAllWithlist();
   Future<void> deleteProduct(String id );
   Future<Either<Failure, bool>> IsProducWishlistt(String id);

}
