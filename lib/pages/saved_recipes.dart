import 'package:cookin/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                const Center(
                  child: FoodCard(),
                ),
                SizedBox(height: 1.5.h),
                const Center(
                  child: FoodCard(),
                ),
                SizedBox(height: 1.5.h),
                const Center(
                  child: FoodCard(),
                ),
                SizedBox(height: 1.5.h),
                const Center(
                  child: FoodCard(),
                ),
                SizedBox(height: 1.5.h),
                const Center(
                  child: FoodCard(),
                ),
                SizedBox(height: 1.5.h),
                const Center(
                  child: FoodCard(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
