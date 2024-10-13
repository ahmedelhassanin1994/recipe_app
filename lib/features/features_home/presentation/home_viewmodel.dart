


import 'package:flutter/cupertino.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';
import 'package:mvvm_project/features/features_home/domain/usecase/recipe_usecase.dart';


enum CategoriesLoadState {InitialState, loading, loaded, error,loadMore, noData, noMore  }



class HomeViewModel extends ChangeNotifier{

  late RecipeUseCase recipeUseCase;



  HomeViewModel(this.recipeUseCase);


  //categories state
  CategoriesLoadState _stateCategories = CategoriesLoadState.InitialState;
  CategoriesLoadState get stateCategories => _stateCategories;
  List<Recipe_Entities> recipes=[];

   int selectIndex = 0;



   final _perPage = 21;
   int _page =0;
   int _page_mostBrands =0;
   final _perPageMostBrands = 10;


   bool _isEnd = false;
   bool isLoading = false;
   bool get isEnd => _isEnd;


   bool _isEndMostBrands = false;
   bool isLoadingMostBrands = false;
   bool get isEndMostBrands => _isEndMostBrands;

  @override
  void dispose() {
    // TODO: implement dispose

  }

  @override
  void start() {
    // TODO: implement start
  }


   void updateStatecategories(CategoriesLoadState categoriesLoadState){
    _stateCategories=categoriesLoadState;
     notifyListeners();
  }





  Future<void> refresh(String lang,String currency)async {
    _stateCategories = CategoriesLoadState.InitialState;
    _page=0;
    notifyListeners();
    getcategories();


  }

  Future<void> getcategories()async {
    if (_stateCategories == CategoriesLoadState.InitialState) {
      _stateCategories = CategoriesLoadState.loading;
      (await recipeUseCase.execute(InputUseCase())).fold((
          l) =>
      {
        _stateCategories = CategoriesLoadState.error,
        print('error ${l.message}'),
        notifyListeners(),
      }, (r) =>
      {
        recipes.clear(),
        recipes.addAll(r),
        _stateCategories = CategoriesLoadState.loaded,

        notifyListeners(),
      });
    }
  }

}
