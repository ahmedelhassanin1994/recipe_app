import 'package:dartz/dartz.dart';
import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/features/features_wishlist/domain/repository/repository_wishlist.dart';


class DeleteWithlistUseCase implements BaseCaseAdd<InputDeleteishlistUseCase> {
  final RepositoryWishlist _repository;

  DeleteWithlistUseCase(this._repository);

  @override
  Future<void> execute(InputDeleteishlistUseCase input) async {
     await _repository.deleteProduct(input.id);
  }
}

class InputDeleteishlistUseCase{
  late String id;

  InputDeleteishlistUseCase(this.id);
}
