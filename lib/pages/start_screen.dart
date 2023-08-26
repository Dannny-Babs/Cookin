// ignore: unused_import
// ignore_for_file: unused_import, duplicate_ignore

import 'package:cookin/pages/login_page.dart';
import 'package:cookin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:cookin/widget/button.dart';

class startScreen extends StatelessWidget {
  const startScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 120),
                    child: Column(
                      children: [
                        Image.asset('images/Icon.png'),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Home of Premium Recipe',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Get \n Cooking',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 0.9,
                      ),
                    ),
                  ),
                  const Text(
                    'Simple way to find Tasty Recipe',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 23,
                      height: 1.9,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF129575), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ), // Rounded corners
                      padding:
                          const EdgeInsets.fromLTRB(50, 15, 50, 15), // Padding
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Start Cooking',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(SolarIconsOutline.arrowRight,
                            color: Colors.white), // Icon with default styling
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
