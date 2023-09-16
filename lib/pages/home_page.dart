import 'package:cookin/apis/recipe_apis.dart';
import 'package:cookin/widget/categories.dart';
import 'package:cookin/widget/modal.dart';
import 'package:cookin/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                text: 'Hello Jega👋',
                              ),
                              MyText(
                                text: 'What are you cooking today?',
                                color: Colors.black26,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ],
                          ),
                          const Spacer(), // Responsive space
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10), // Border radius of 10
                            child: Image.asset(
                              'images/profile.png',
                              height: 60,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const Flexible(
                            flex: 5,
                            child: MyInput_Box(
                              placeHolder: 'Search Recipes',
                              marginVertical: 4,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          const Flexible(
                            flex: 1,
                            child: FilterModal(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const Categories(),
                     SizedBox(
                        height: 2.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _recipes.map((recipe) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: OverflowCard(
                                title: recipe.name,
                                cookTime: recipe.totalTime,
                                rating: recipe.rating.toString(),
                                thumbnailUrl: recipe.images,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const MyText(
                        text: 'New Recipes',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _recipes.map((recipe) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: OverflowCard2(
                                title: recipe.name,
                                cookTime: recipe.totalTime,
                                rating: recipe.rating.toString(),
                                thumbnailUrl: recipe.images,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
