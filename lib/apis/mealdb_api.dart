import 'dart:convert';
import 'package:cookin/models/categoryItem_model.dart';
import 'package:cookin/models/category_model.dart';
import 'package:cookin/models/item_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:http/http.dart' show Client;

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

class MealsApi {
  Client client = Client();

  Future<ItemModel> fetchMeals(String type) async {
    // Fetch the list of meals from the Meals API.
    final mealsUrl =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$type');
    final response = await client.get(mealsUrl);

    // If the response is successful, return the list of meals.
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If the response is not successful, throw an exception.
      throw Exception('Failed to load list meals');
    }
  }

  Future<ItemModel> fetchDetail(String id) async {
    // Fetch the meal details from the Meals API.
    final mealsUrl =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');
    final response = await client.get(mealsUrl);

    // If the response is successful, return the meal details.
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If the response is not successful, throw an exception.
      throw Exception('Failed to load detail meals');
    }
  }

  Future<ItemModel> searchMeals(String name) async {
    // Search for meals by name from the Meals API.
    final mealsUrl =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$name');
    final response = await client.get(mealsUrl);

    // If the response is successful, return the list of meals.
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If the response is not successful, throw an exception.
      throw Exception('Failed to load $name meals');
    }
  }

  Future<ItemModel> randomMeals() async {
    // Fetch a random meal from the Meals API.
    final mealsUrl =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php');
    final response = await client.get(mealsUrl);

    // If the response is successful, return the meal details.
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If the response is not successful, throw an exception.
      throw Exception('Failed to load detail meals');
    }
  }

  // ignore: non_constant_identifier_names
 static Future<List<MealsByCategorie>> GetMealByCategory(String CategoryName) async {
    final response = await http.get(
      Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/filter.php?c=$CategoryName'),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final meals = json['meals'] as List;
      return meals.map((e) => MealsByCategorie.fromJson(e)).toList();
    } else {
      throw Exception('Failed to get meals by category');
    }
  }

  Future<CategoryItemModel> fetchCategories(String category) async {
    final mealsUrl = Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');
    final response = await client.get(mealsUrl);

    if (response.statusCode == 200) {
      return CategoryItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list of $category meals');
    }
  }
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
