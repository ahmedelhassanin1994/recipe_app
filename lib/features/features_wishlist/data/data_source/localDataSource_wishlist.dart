import 'package:hive/hive.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';


abstract class LocalDataSourceWishlist {
  Future<Box> Openbox();
  Future<List<Recipe_Entities>> getCacheWishlist();
  Future<void> AddWishlist(Recipe_Entities modelProductWishlist);
  Future<void> deleteAllWithlist();
  Future<void> deleteProduct(String id);
  Future<bool> IsProducWishlistt(String id);


}

class LocalDataSourceWishlistImplementer implements LocalDataSourceWishlist {
  @override
  Future<void> AddWishlist(Recipe_Entities modelProductWishlist) async {
    // TODO: implement AddCache
    final box = await Openbox();
    await box.add(modelProductWishlist);
  }

  @override
  Future<Box> Openbox() async {
    // TODO: implement Openbox
    var box = await Hive.openBox<Recipe_Entities>(Constant.localKey_wishlist);
    return box;
  }

  @override
  Future<void> deleteAllWithlist() async {
    // TODO: implement deleteLocal

    final box = await Openbox();
    final Map<dynamic, dynamic> deliveriesMap = box.toMap();
    dynamic desiredKey;
    if (deliveriesMap.isNotEmpty) {
      deliveriesMap.forEach((key, value) {
        if (value.key == Constant.localKey_wishlist) {
          desiredKey = key;
        }
      });
      box.delete(desiredKey);
    }
  }

  @override
  Future<List<Recipe_Entities>> getCacheWishlist() async {
    // TODO: implement getCache
    final box = await Openbox();
    List<Recipe_Entities> model = box.values.cast<Recipe_Entities>().toList();
    return model;
  }

  @override
  Future<void> deleteProduct(String id) async{
    // TODO: implement deleteProduct
    final box = await Openbox();
    List<Recipe_Entities> model = box.values.cast<Recipe_Entities>().toList();
    for(int i=0;i<model.length;i++){
        if(model[i].id==id){
          box.deleteAt(i);
          break ;
        }
    }
  }

  @override
  Future<bool> IsProducWishlistt(String id) async{
    // TODO: implement IsProducWishlistt
    final box = await Openbox();
    List<Recipe_Entities> model = box.values.cast<Recipe_Entities>().toList();
   late bool Isfavorite=false;

    for(int i=0;i<model.length;i++){
      if(model[i].id==id){

        Isfavorite= true;
        break ;
      }else{
      }
    }
    return Isfavorite;
  }
}
