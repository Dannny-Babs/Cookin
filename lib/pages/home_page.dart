import 'package:cookin/widget/widget.dart';
import 'package:flutter/material.dart';
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
                          'Hello Jega👋',
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                        MyText(
                          'What are you cooking today?',
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
                const Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: MyInput_Box(
                        placeHolder: 'Search Recipe',
                        marginVertical: 4,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                        flex: 1,
                        child: IconButtonNav(
                            color: Colors.white,
                            icon: SolarIconsOutline.tuning_2)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
