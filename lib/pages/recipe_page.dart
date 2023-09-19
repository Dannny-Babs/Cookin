// ignore: unused_import
import 'package:cookin/utils/tabs.dart';
import 'package:cookin/widget/notification_alert.dart';
import 'package:flutter/material.dart';
import '../apis/recipe_apis.dart';
import 'package:cookin/utils/recipe.dart';
import 'package:cookin/utils/utils.dart';
import 'package:cookin/widget/button.dart';
import 'package:cookin/widget/card.dart';
import 'package:cookin/widget/text.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  List<Recipe> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getRecipes();
  }

  Future<void> getRecipes() async {
    try {
      // Fetch recipes asynchronously
      _recipes = await RecipeApi.getRecipe();
    } catch (e) {
      // Handle errors here, e.g., show an error message or log the error.
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if _recipes is empty before accessing its first element
    final recipe = _recipes.isNotEmpty
        ? _recipes[0]
        : Recipe(
            images: 'thumbnailUrl',
            name: 'title',
            rating: 8,
            totalTime: 'cookTime');

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
                  content: Text('Snackbar'),
                  duration: Duration(milliseconds: 1000),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(SolarIconsBold.bookmark,
                color: AppColors.primaryColor), // Replace with your icon
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FoodCard(
                            title: "",
                            isLoading: _isLoading,
                            cookTime: recipe.totalTime,
                            rating: recipe.rating.toString(),
                            thumbnailUrl: recipe.images,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: MyText(
                              text: recipe.name,
                              fontSize: 23,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  'images/profile.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: ' Champagne Papi',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Row(
                                    children: [
                                      Icon(SolarIconsBold.mapPointWave,
                                          size: 18,
                                          color: AppColors.primaryColor),
                                      SizedBox(width: 5),
                                      MyText(
                                        text: 'Lagos, Nigeria',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const RajiFilledButtonSolo(
                                  color: AppColors.primaryColor, text: 'Follow')
                            ],
                          ),
                          const SizedBox(height: 30),
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
              body: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 120,
                    child: TabBarView(
                      controller: _tabController,
                      children: const <Widget>[
                        IngredientCard(),
                        NotificationCard(),
                      ],
                    ),
                  ),
                ],
              )),
    );
  }
}
