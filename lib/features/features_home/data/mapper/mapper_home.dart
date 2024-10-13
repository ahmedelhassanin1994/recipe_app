

// to convert the response into an non nullable object (model)

import 'package:mvvm_project/core/common/extensions.dart';
import 'package:mvvm_project/features/features_home/data/responeses/model_recipe.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';

const EMPTY="";
const ZERO=0;
const STATUS=false;
const Double=0.0;



extension ProductDataMapper on ModelRecipeResponse?{
  Recipe_Entities toDomain(){

    return Recipe_Entities(this!.id.orEmpty(),this!.fats.orEmpty(),this!.name.orEmpty(),this!.time.orEmpty(),this!.image.orEmpty(),this?.weeks ?? [],
      this!.carbos.orEmpty(),this!.fibers.orEmpty(),this?.rating ?? Double,this!.country.orEmpty(),this!.ratings.orZero(),this!.calories.orEmpty(),
      this!.headline.orEmpty(),this?.keywords ?? [],this!.products ?? [],this!.proteins.orEmpty(),this!.favorites.orZero(),
      this!.difficulty.orZero(),this!.description.orEmpty(),this!.highlighted.orBool(),this?.deliverableIngredients ??[],


    );
  }

}







