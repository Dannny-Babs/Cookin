import 'package:cookin/utils/recipe.dart';
import 'package:cookin/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../apis/recipe_apis.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyText(
                        text: 'Saved Recipes',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      const MyText(
                        text: 'See your saved recipes and try them out again.',
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                      SizedBox(height: 3.h),
                      SingleChildScrollView(
                        child: Column(
                          children: _recipes.map((recipe) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FoodCard(
                                title: recipe.name,
                                thumbnailUrl: recipe.images,
                                isLoading: _isLoading,
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
