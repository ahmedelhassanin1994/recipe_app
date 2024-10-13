import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';


abstract class RepositoryHome {

   Future<Either<Failure,List<Recipe_Entities>>> getRecipe();

}
