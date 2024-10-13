import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/core/common/network/failure.dart';
import 'package:mvvm_project/features/features_wishlist/domain/repository/repository_wishlist.dart';


class IsProducWishlisttUseCase implements BaseCase<InputIsWishlistUseCase, bool> {
  final RepositoryWishlist _repository;

  IsProducWishlisttUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(InputIsWishlistUseCase input) async {
    return await _repository.IsProducWishlistt(input.id);
  }
}

class InputIsWishlistUseCase{
  String id;

  InputIsWishlistUseCase(this.id);
}
