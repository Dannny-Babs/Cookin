class CategoryItemModel {
  late List<CategoriesItem> _categoriesItem;

  CategoryItemModel({required List<CategoriesItem> categoriesItem})
      : _categoriesItem = categoriesItem;

  CategoryItemModel.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      _categoriesItem = List<CategoriesItem>.from(
        json['meals'].map((v) => CategoriesItem.fromJson(v)),
      );
    } else {
      _categoriesItem = [];
    }
  }

  List<CategoriesItem> get categoriesItem {
    return [..._categoriesItem];
  }
}

class CategoriesItem {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  CategoriesItem({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  CategoriesItem.fromJson(Map<String, dynamic> json)
      : strMeal = json['strMeal'],
        strMealThumb = json['strMealThumb'],
        idMeal = json['idMeal'];
}
