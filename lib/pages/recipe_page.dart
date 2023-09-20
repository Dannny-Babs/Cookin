// ignore: unused_import
import 'dart:ffi';

import 'package:cookin/apis/recipe_reps.dart';
import 'package:flutter/material.dart';
import 'package:cookin/utils/utils.dart';
import 'package:cookin/widget/card.dart';
import 'package:cookin/widget/text.dart';

import '../models/item_model.dart';

class RecipePage extends StatefulWidget {
  const RecipePage(
      {Key? key, required this.mealId, required RecipesRepository repository})
      : _repository = repository,
        super(key: key);

  final int mealId;
  final RecipesRepository _repository;

  @override
  // ignore: library_private_types_in_public_api
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(SolarIconsOutline.arrowLeft),
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 3,
        shadowColor: Colors.black26,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Coming soon'),
                  duration: Duration(milliseconds: 1000),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(
              SolarIconsBold.menuDots,
            ), // Replace with your icon
          ),
        ],
      ),
      body: FutureBuilder<ItemModel>(
        future: widget._repository.fetchDetailMeals(widget.mealId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Meals>? index = snapshot.data?.meals;

            return NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: FoodCard(
                              title: "",
                              isLoading: false,
                              thumbnailUrl: index![0].strMealThumb,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: MyText(
                              text: index[0].strMeal,
                              fontSize: 23,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          MyText(
                            text: index[0].strCategory,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                          const SizedBox(height: 25),
                          const SizedBox(height: 20),
                          Center(
                            child: Container(
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                              ),
                              child: TabBar(
                                  controller: _tabController,
                                  labelColor: AppColors.white,
                                  labelPadding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  indicatorPadding: const EdgeInsets.symmetric(
                                      horizontal: -33, vertical: 8),
                                  unselectedLabelColor:
                                      AppColors.secondaryColor,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      10.0,
                                    ),
                                    color: AppColors.primaryColor,
                                  ),
                                  tabs: const [
                                    Tab(
                                      text: 'Ingredients',
                                    ),
                                    Tab(
                                      text: ' Procedure',
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 2,
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          IngredientCard2(
                            mealId: widget.mealId,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height * 1,
                                padding: const EdgeInsets.all(16.0),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromRGBO(
                                      217, 217, 217, 0.379),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const MyText(
                                        text: 'Follow the instructions below',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                    const SizedBox(height: 10),
                                    Text(
                                      index![0].strInstructions,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Colors.black54,
                                        height: 1.95,
                                        letterSpacing: 0.1,
                                      ),
                                      textAlign: TextAlign.justify,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class IngredientCard2 extends StatelessWidget {
  const IngredientCard2({Key? key, required this.mealId}) : super(key: key);

  final int mealId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ItemModel>(
      future: RecipesRepository().fetchDetailMeals(mealId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Meals>? index = snapshot.data?.meals;
          // ignore: non_constant_identifier_names
          List<dynamic> Ingredient = [
            index![0].strIngredient1,
            index[0].strIngredient2,
            index[0].strIngredient3,
            index[0].strIngredient4,
            index[0].strIngredient5,
            index[0].strIngredient6,
            index[0].strIngredient7,
            index[0].strIngredient8,
            index[0].strIngredient9,
            index[0].strIngredient10,
            index[0].strIngredient11,
            index[0].strIngredient12,
            index[0].strIngredient1,
            index[0].strIngredient14,
            index[0].strIngredient15,
            index[0].strIngredient16,
            index[0].strIngredient17,
            index[0].strIngredient18,
            index[0].strIngredient19,
            index[0].strIngredient20,
          ];

          // ignore: non_constant_identifier_names
          List<dynamic> Measure = snapshot.hasData
              ? [
                  index[0].strMeasure1,
                  index[0].strMeasure2,
                  index[0].strMeasure3,
                  index[0].strMeasure4,
                  index[0].strMeasure5,
                  index[0].strMeasure6,
                  index[0].strMeasure7,
                  index[0].strMeasure8,
                  index[0].strMeasure9,
                  index[0].strMeasure10,
                  index[0].strMeasure11,
                  index[0].strMeasure12,
                  index[0].strMeasure13,
                  index[0].strMeasure14,
                  index[0].strMeasure15,
                  index[0].strMeasure16,
                  index[0].strMeasure17,
                  index[0].strMeasure18,
                  index[0].strMeasure19,
                  index[0].strMeasure20,
                ]
              : [];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: buildIngredientList(Ingredient, Measure),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class IngredientSearch {
  static String findIngredientImageUrl(String ingredientName) {
    // Define the base URL for ingredient images
    const baseUrl = 'https://www.themealdb.com/images/ingredients/';

    // Replace spaces, underscores, and hyphens with "%20" and make it lowercase
    final sanitizedIngredientName =
        ingredientName.replaceAll(RegExp(r'[_ -]'), '%20').toLowerCase();

    // Construct the full image URL
    final imageUrl = '$baseUrl$sanitizedIngredientName.png';

    return imageUrl;
  }
}

Widget buildIngredientList(List<dynamic> ingredients, List<dynamic> measures) {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: ingredients.length,
    itemBuilder: (context, index) {
      final ingredient = ingredients[index];
      final measure = measures[index];

      if (ingredient == null || ingredient.isEmpty) {
        return Container();
      }

      final ingredientImageUrl =
          IngredientSearch.findIngredientImageUrl(ingredient);

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(217, 217, 217, 0.498),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      ingredientImageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                ' $ingredient',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              if (measure != null && measure.isNotEmpty)
                Text(
                  '- $measure',
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
      );
    },
  );
}
