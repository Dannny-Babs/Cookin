

class MealsByCategorie {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  MealsByCategorie({this.strMeal, this.strMealThumb, this.idMeal});

  MealsByCategorie.fromJson(Map<String, dynamic> json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
   
  }
  
   
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['strMeal'] = strMeal;
    data['strMealThumb'] = strMealThumb;
    data['idMeal'] = idMeal;
    return data;
  }
}