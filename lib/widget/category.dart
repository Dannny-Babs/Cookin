import 'package:cookin/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../apis/mealdb_api.dart';
import '../utils/utils.dart';

class Categories2 extends StatefulWidget {
  const Categories2({
    super.key,
  });

  @override
  State<Categories2> createState() => _Categories2State();
}

class _Categories2State extends State<Categories2> {
  List<String> categories = []; // Initialize with an empty list
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Fetch and update the list of categories from the API
    fetchMeals().then((meals) {
      setState(() {
        categories = ['All', ...meals.map((meal) => meal.strCategory).toList()];
      });
    }).catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: SizedBox(
        height: 5.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    if (index >= 0 && index < categories.length) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryPage(value: categories[index]),
              ),
            );
          });
        },
        child: Container(
          margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color:
                selectedIndex == index ? AppColors.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              categories[index],
              style: TextStyle(
                color: selectedIndex == index
                    ? Colors.white
                    : AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    } else {
      // Handle the case where the index is out of bounds gracefully.
      // You can return an empty container or a placeholder.
      return Container();
    }
  }
}
