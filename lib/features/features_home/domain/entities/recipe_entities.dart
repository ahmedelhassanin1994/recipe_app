

import 'package:hive_flutter/hive_flutter.dart';
part 'recipe_entities.g.dart';

@HiveType(typeId: 5)
class Recipe_Entities{
 @HiveField(0)
 late String id;
 @HiveField(1)
 late String fats;
 @HiveField(2)
 late String name;
 @HiveField(3)
 late String time;
 @HiveField(4)
 late String image;
 @HiveField(5)
 late List<String> weeks=[];
 @HiveField(6)
 late String Carbos;
 @HiveField(7)
 late String fibers;
 @HiveField(8)
 late dynamic rating;
 @HiveField(9)
 late String country;
 @HiveField(10)
 late int ratings;
 @HiveField(11)
 late String calories;
 @HiveField(12)
 late String headline;
 @HiveField(13)
 late List<String> keywords=[];
 @HiveField(14)
 late List<String> products=[];
 @HiveField(15)
 late String proteins;
 @HiveField(16)
 late int favorites;
 @HiveField(17)
 late int difficulty;
 @HiveField(18)
 late String description;
 @HiveField(19)
 late bool highlighted;
 @HiveField(20)
 late List<String> deliverableIngredients;

 Recipe_Entities(
      this.id,
      this.fats,
      this.name,
      this.time,
      this.image,
      this.weeks,
      this.Carbos,
      this.fibers,
      this.rating,
      this.country,
      this.ratings,
      this.calories,
      this.headline,
      this.keywords,
      this.products,
      this.proteins,
      this.favorites,
      this.difficulty,
      this.description,
      this.highlighted,

      this.deliverableIngredients);
}