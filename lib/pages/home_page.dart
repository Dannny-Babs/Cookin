import 'package:cookin/apis/recipe_apis.dart';
import 'package:cookin/apis/recipe_reps.dart';
import 'package:cookin/widget/modal.dart';
import 'package:cookin/widget/searchbar.dart';
import 'package:cookin/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/recipe.dart';
import '../widget/category.dart';

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
                        height: 2,
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
                              height: 45,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Flexible(
                            flex: 5,
                            child: SearchBarFood(
                              hintText: ' Search for food....',
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
                      const SizedBox(
                        height: 10,
                      ),
                      const Categories2(),
                      const SizedBox(
                        height: 7,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _recipes.map((recipe) {
                            return OverflowCard(
                              repository: RecipesRepository(),
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
                      const SizedBox(
                        height: 2,
                      ),
                      SizedBox(
                        height: 220,
                        child: OverflowCard2(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
