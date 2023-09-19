import 'dart:convert';
import 'package:http/http.dart' as http;

class Meal {
  String strCategory;

  Meal({
    required this.strCategory,
  });

  factory Meal.fromRawJson(String str) => Meal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strCategory: json["strCategory"],
      );

  Map<String, dynamic> toJson() => {
        "strCategory": strCategory,
      };
}

Future<List<Meal>> fetchMeals() async {
  final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?c=list'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final List<dynamic> mealsList = jsonData['meals'];
    return mealsList.map((item) => Meal.fromJson(item)).toList();
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    throw Exception('Failed to load meal data');
  }
}
