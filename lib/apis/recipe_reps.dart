import 'dart:async';

import 'package:cookin/models/categoryItem_model.dart';


import '../models/item_model.dart';
import 'mealdb_api.dart';

class RecipesRepository {
  final mealsApi = MealsApi();

  Future<ItemModel> fetchAllMeals(String type) => mealsApi.fetchMeals(type);

  Future<ItemModel> fetchDetailMeals(int id) =>
      mealsApi.fetchDetail(id.toString());

  Future<ItemModel> searchMeals(String name) => mealsApi.searchMeals(name);

  Future<ItemModel> randomMeals() => mealsApi.randomMeals();

  Future<CategoryItemModel> fetchCategories(String category) =>
      mealsApi.fetchCategories(category);
}
