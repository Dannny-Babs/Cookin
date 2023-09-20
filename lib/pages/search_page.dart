import 'package:cookin/widget/card.dart';
import 'package:flutter/material.dart';

import '../apis/recipe_apis.dart';
import '../utils/recipe.dart';
import '../widget/input_box.dart';
import '../widget/modal.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<Recipe> _recipes = []; // Initialize as an empty list
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
      appBar: AppBar(
        title: const Text(
          'Search Page',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 3,
        shadowColor: Colors.black26,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Row(
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
                ),
              ),
            ];
          },
          body: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Set the number of columns here
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: _recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = _recipes[index];
                      return FoodCard2(
                        title: recipe.name,
                        thumbnailUrl: recipe.images,
                      );
                    },
                  ),
                )),
    );
  }
}
