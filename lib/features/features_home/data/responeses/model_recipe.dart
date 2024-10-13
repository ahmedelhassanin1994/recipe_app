

class ModelRecipeResponse {
  String? id;
  String? fats;
  String? name;
  String? time;
  String? image;
  List<String>? weeks;
  String? carbos;
  String? fibers;
  dynamic? rating;
  String? country;
  int? ratings;
  String? calories;
  String? headline;
  List<String>? keywords;
  List<String>? products;
  String? proteins;
  int? favorites;
  int? difficulty;
  String? description;
  bool? highlighted;
  List<String>? ingredients;
  dynamic? incompatibilities;
  List<String>? deliverableIngredients;

  ModelRecipeResponse(
      {this.id,
        this.fats,
        this.name,
        this.time,
        this.image,
        this.weeks,
        this.carbos,
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
        this.ingredients,
        this.incompatibilities,
        this.deliverableIngredients,});

  ModelRecipeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fats = json['fats'];
    name = json['name'];
    time = json['time'];
    image = json['image'];
    weeks = json['weeks'].cast<String>();
    carbos = json['carbos'];
    fibers = json['fibers'];
    rating = json['rating'];
    country = json['country'];
    ratings = json['ratings'];
    calories = json['calories'];
    headline = json['headline'];
    keywords = json['keywords'].cast<String>();
    products = json['products'].cast<String>();
    proteins = json['proteins'];
    favorites = json['favorites'];
    difficulty = json['difficulty'];
    description = json['description'];
    highlighted = json['highlighted'];
    ingredients = json['ingredients'].cast<String>();
    incompatibilities = json['incompatibilities'];
    deliverableIngredients = json['deliverable_ingredients'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fats'] = this.fats;
    data['name'] = this.name;
    data['time'] = this.time;
    data['image'] = this.image;
    data['weeks'] = this.weeks;
    data['carbos'] = this.carbos;
    data['fibers'] = this.fibers;
    data['rating'] = this.rating;
    data['country'] = this.country;
    data['ratings'] = this.ratings;
    data['calories'] = this.calories;
    data['headline'] = this.headline;
    data['keywords'] = this.keywords;
    data['products'] = this.products;
    data['proteins'] = this.proteins;
    data['favorites'] = this.favorites;
    data['difficulty'] = this.difficulty;
    data['description'] = this.description;
    data['highlighted'] = this.highlighted;
    data['ingredients'] = this.ingredients;
    data['incompatibilities'] = this.incompatibilities;
    data['deliverable_ingredients'] = this.deliverableIngredients;

    return data;
  }
}