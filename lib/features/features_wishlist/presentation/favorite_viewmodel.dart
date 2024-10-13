

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';
import 'package:mvvm_project/features/features_wishlist/domain/usecase/Addwishlist_usecase.dart';
import 'package:mvvm_project/features/features_wishlist/domain/usecase/deleteItemwishlist_usecase.dart';
import 'package:mvvm_project/features/features_wishlist/domain/usecase/isProductwishlist_usecase.dart';
import 'package:mvvm_project/features/features_wishlist/domain/usecase/wishlist_usecase.dart';



class FavoriteViewModel extends ChangeNotifier{

 late AddWithlistUseCase addWithlistUseCase;
 late DeleteWithlistUseCase deleteWithlistUseCase;
 late WithlistUseCase withlistUseCase;
 late IsProducWishlisttUseCase isProducWishlisttUseCase;
 bool Isfavorite=false;
 List<Recipe_Entities> wishlist=[];



 FavoriteViewModel(this.addWithlistUseCase, this.deleteWithlistUseCase, this.withlistUseCase,this.isProducWishlisttUseCase);

  @override
  void dispose() {
    // TODO: implement dispose

  }

  @override
  void start() {
    // TODO: implement start
  }

 Future<void> AddWithlist(Recipe_Entities modelProduct )async {

  (await addWithlistUseCase.execute(modelProduct)
  );

  Isfavorite =!Isfavorite;
  notifyListeners();
 }

 Future<void> IsProducWishlistt(String id )async {
  (await isProducWishlisttUseCase.execute(InputIsWishlistUseCase(id))).fold((l) =>
  {
   Isfavorite=false,
   notifyListeners(),
  }, (r) =>
  {
   Isfavorite=r,
  notifyListeners(),


  });
 }

 Future<void> getWishlist()async {
  (await withlistUseCase.execute(InputWishlistUseCase())).fold((l) =>
  {
   Isfavorite=false,
   notifyListeners(),
  }, (r) =>
  {
   wishlist.clear(),
   wishlist.addAll(r.reversed),
   notifyListeners(),
  });
 }

 Future<void> deleteProduct(String id)async {
  (await deleteWithlistUseCase.execute(InputDeleteishlistUseCase(id)));
  Isfavorite =!Isfavorite;
  notifyListeners();
 }

}
