import 'package:cookin/utils/colors.dart';
import 'package:cookin/utils/food_names.dart';
import 'package:cookin/widget/button.dart';
import 'package:cookin/widget/text.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:solar_icons/solar_icons.dart';

class OverflowCard extends StatelessWidget {
  const OverflowCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Random ran = Random();
    final double circleRadius = 150.0;
    final double circleBorderWidth = 8.0;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: circleRadius / 2.0),
            child: Container(
              height: size.height * 0.23,
              width: size.width * 0.45,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: const Color.fromRGBO(217, 217, 217, 0.5),
              ),

              child: Column(
                children: [
                  SizedBox(height: size.height * 0.079),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Foodnames(),
                        SizedBox(height: size.height * 0.02),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MyText(
                                  text: 'Time',
                                  color: Colors.black38,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                MyText(
                                  text:
                                      '${(Random().nextInt(45) + 15).toString()} mins',
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            SizedBox(width: size.width * 0.15),
                            IconButton.filled(
                              onPressed: () {},
                              icon: const Icon(SolarIconsOutline.bookmark),
                              iconSize: 18,
                              color: AppColors.primaryColor,
                              style: IconButton.styleFrom(
                                backgroundColor: AppColors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ), // Space for the image
            ),
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                width: circleRadius,
                height: circleRadius,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(32, 32, 32, 0.15),
                      offset: Offset(0, 8),
                      blurRadius: 26,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(circleBorderWidth),
                  child: const DecoratedBox(
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/a/a0/Bill_Gates_2018.jpg',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 55,
                child: Align(
                    alignment: Alignment.centerRight,
                    child:
                        StarRatingWidget()), // Place your overlay widget here
              ),
            ],
          )
        ],
      ),
    );
  }
}

class StarRatingWidget extends StatelessWidget {
  final Random random = Random();

  double generateRandomRating() {
    return random.nextDouble() * 5.0; // Generate a rating between 0.0 and 5.0
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double rating = generateRandomRating();

    return Container(
      decoration: BoxDecoration(
          color: Colors.amber[200],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.004, horizontal: size.height * 0.008),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star_rounded,
                color: Colors.amber,
                size: 16,
              ),
              const SizedBox(width: 2),
              Text(
                rating.toStringAsFixed(
                    1), // Display the rating with one decimal place
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
