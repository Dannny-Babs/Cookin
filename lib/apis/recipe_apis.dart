import 'dart:convert';

import 'package:cookin/utils/recipe.dart';
import 'package:http/http.dart' as http;


class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '9cf4dc1c1dmsh905a10385aed3c3p19981cjsn5f5d3e4ce9a3',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    // ignore: no_leading_underscores_for_local_identifiers
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
