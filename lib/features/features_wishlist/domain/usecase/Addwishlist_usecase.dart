import 'package:mvvm_project/core/common/base/base_usecase.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';
import 'package:mvvm_project/features/features_wishlist/domain/repository/repository_wishlist.dart';


class AddWithlistUseCase implements BaseCaseAdd<Recipe_Entities> {
  final RepositoryWishlist _repository;

  AddWithlistUseCase(this._repository);

  @override
  Future<void> execute(Recipe_Entities input) async {

     await _repository.AddWishlist(input);

  }
}
