import 'package:cookin/utils/colors.dart';
import 'package:cookin/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:solar_icons/solar_icons.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
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
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Flexible(
                      flex: 5,
                      child: MyInput_Box(
                        placeHolder: 'Search Recipe',
                        marginVertical: 4,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    const Flexible(
                        flex: 1,
                        child: IconButtonNav(
                            color: Colors.white,
                            icon: SolarIconsOutline.tuning_2)),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
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
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                SingleChildScrollView(
                  
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
