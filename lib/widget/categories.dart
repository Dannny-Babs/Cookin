import 'package:cookin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    'All',
    'Italian',
    'Asian',
    'Chinese',
    'Burgers',
    'Pizza',
    'Desserts',
    'Salads',
    'Drinks',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: SizedBox(
        height: 5.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: selectedIndex == index ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            categories[index],
            style: TextStyle(
              color: selectedIndex == index
                  ? Colors.white
                  : AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
