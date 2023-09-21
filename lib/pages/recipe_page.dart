// ignore: unused_import
import 'dart:ffi';

import 'package:cookin/apis/recipe_reps.dart';
import 'package:cookin/widget/ingredient.dart';
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

  bool checkTabController() {
    return _tabController.index == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(SolarIconsOutline.arrowLeft)),
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
                              thumbnailUrl: index[0].strMealThumb,
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
                          Row(
                            children: [
                              MyText(
                                text: index[0].strCategory,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                              const Spacer(),
                              const MyText(
                                text: ' Area: ',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              MyText(
                                text: index[0].strArea,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
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
              body: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  SingleChildScrollView(
                    child: IngredientCard2(
                      mealId: widget.mealId,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16.0),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(217, 217, 217, 0.379),
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
                    ),
                  )
                ],
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
