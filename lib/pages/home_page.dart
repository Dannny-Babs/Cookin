import 'package:cookin/utils/colors.dart';
import 'package:cookin/widget/modal.dart';
import 'package:cookin/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
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
                      borderRadius:
                          BorderRadius.circular(10), // Border radius of 10
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
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MyFilledButtonSolo(
                        color: Colors.white,
                        bgcolor: AppColors.primaryColor,
                        text: 'All',
                      ),
                      MyFilledButtonSolo(
                        bgcolor: Colors.white,
                        color: AppColors.primaryColor,
                        text: 'African',
                        resppadding: 0.03,
                      ),
                      MyFilledButtonSolo(
                        bgcolor: Colors.white,
                        color: AppColors.primaryColor,
                        text: 'Drinks',
                        resppadding: 0.03,
                      ),
                      MyFilledButtonSolo(
                        bgcolor: Colors.white,
                        color: AppColors.primaryColor,
                        text: 'Intercontinental',
                        resppadding: 0.03,
                      ),
                      MyFilledButtonSolo(
                        bgcolor: Colors.white,
                        color: AppColors.primaryColor,
                        text: 'Snacks',
                        resppadding: 0.03,
                      ),
                      MyFilledButtonSolo(
                        bgcolor: Colors.white,
                        color: AppColors.primaryColor,
                        text: 'Asian',
                        resppadding: 0.03,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      OverflowCard(),
                      OverflowCard(),
                      OverflowCard(),
                      OverflowCard(),
                      OverflowCard(),
                      OverflowCard(),
                    ],
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
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      OverflowCard2(),
                      OverflowCard2(),
                      OverflowCard2(),
                      OverflowCard2(),
                      OverflowCard2(),
                      OverflowCard2(),
                    ],
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
