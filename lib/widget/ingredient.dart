import 'package:cookin/apis/recipe_reps.dart';
import 'package:cookin/models/item_model.dart';
import 'package:cookin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class IngredientCard2 extends StatelessWidget {
  const IngredientCard2({Key? key, required this.mealId}) : super(key: key);

  final int mealId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ItemModel>(
      future: RecipesRepository().fetchDetailMeals(mealId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: Shimmer(
            gradient: const LinearGradient(
              colors: [
                Colors.white,
                Colors.grey,
              ],
            ),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ));
        } else if (snapshot.hasError || !snapshot.hasData) {
          return const Center(child: Text("Error fetching data"));
        }

        final index = snapshot.data!.meals[0];
        final ingredients = [
          index.strIngredient1,
          index.strIngredient2,
          index.strIngredient3,
          index.strIngredient4,
          index.strIngredient5,
          index.strIngredient6,
          index.strIngredient7,
          index.strIngredient8,
          index.strIngredient9,
          index.strIngredient10,
          index.strIngredient11,
          index.strIngredient12,
          index.strIngredient13,
          index.strIngredient14,
          index.strIngredient15,
          index.strIngredient16,
          index.strIngredient17,
          index.strIngredient18,
          index.strIngredient19,
          index.strIngredient20,
        ];
        final measures = [
          index.strMeasure1,
          index.strMeasure2,
          index.strMeasure3,
          index.strMeasure4,
          index.strMeasure5,
          index.strMeasure6,
          index.strMeasure7,
          index.strMeasure8,
          index.strMeasure9,
          index.strMeasure10,
          index.strMeasure11,
          index.strMeasure12,
          index.strMeasure13,
          index.strMeasure14,
          index.strMeasure15,
          index.strMeasure16,
          index.strMeasure17,
          index.strMeasure18,
          index.strMeasure19,
          index.strMeasure20,
        ];

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildIngredientList(ingredients, measures),
        );
      },
    );
  }
}

class IngredientSearch {
  static final Map<String, String> _ingredientImageCache = {};

  static String findIngredientImageUrl(String ingredientName) {
    if (_ingredientImageCache.containsKey(ingredientName)) {
      return _ingredientImageCache[ingredientName]!;
    }

    const baseUrl = 'https://www.themealdb.com/images/ingredients/';
    final sanitizedIngredientName =
        ingredientName.replaceAll(RegExp(r'[_ -]'), '%20').toLowerCase();
    final imageUrl = '$baseUrl$sanitizedIngredientName.png';

    _ingredientImageCache[ingredientName] = imageUrl;

    return imageUrl;
  }
}

Widget buildIngredientList(List<String?> ingredients, List<String?> measures) {
  return ListView.separated(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: ingredients.length,
    separatorBuilder: (context, index) => const SizedBox(height: 10),
    itemBuilder: (context, index) {
      final ingredient = ingredients[index];
      final measure = measures[index];

      if (ingredient == null || ingredient.isEmpty) {
        return Container();
      }

      final ingredientImageUrl =
          IngredientSearch.findIngredientImageUrl(ingredient);

      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(217, 217, 217, 0.498),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: ingredientImageUrl,
              imageBuilder: (context, imageProvider) => Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Shimmer(
                gradient: const LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.grey,
                  ],
                ),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ingredient,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Measure',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (measure != null && measure.isNotEmpty)
                        Text(
                          measure,
                          textWidthBasis: TextWidthBasis.longestLine,
                          softWrap: true,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
