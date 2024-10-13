import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';
import 'package:mvvm_project/features/features_wishlist/domain/repository/repository_wishlist.dart';


class WithlistUseCase implements BaseCase<InputWishlistUseCase, List<Recipe_Entities>> {
  final RepositoryWishlist _repository;

  WithlistUseCase(this._repository);

  @override
  Future<Either<Failure, List<Recipe_Entities>>> execute(InputWishlistUseCase input) async {
    return await _repository.getCacheWishlist();
  }
}

class InputWishlistUseCase{
}
