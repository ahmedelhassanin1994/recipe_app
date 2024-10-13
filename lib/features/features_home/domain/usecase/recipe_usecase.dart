import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';
import 'package:mvvm_project/features/features_home/domain/repository/repository_home.dart';


class RecipeUseCase implements BaseCase<InputUseCase,List<Recipe_Entities>> {
  final RepositoryHome _repository;

  RecipeUseCase(this._repository);

  @override
  Future<Either<Failure,List<Recipe_Entities>>> execute(InputUseCase input) async {
    return await _repository.getRecipe();
  }
}

class InputUseCase{


}
