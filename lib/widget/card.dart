import 'package:cookin/utils/colors.dart';
import 'package:cookin/utils/food_names.dart';

import 'package:cookin/widget/text.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:solar_icons/solar_icons.dart';

class OverflowCard extends StatelessWidget {
  const OverflowCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double circleRadius = 150.0;
    final double circleBorderWidth = 8.0;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: circleRadius / 2.0),
            child: Container(
              height: 23.8.h,
              width: Adaptive.w(43),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: const Color.fromRGBO(217, 217, 217, 0.5),
              ),

              child: Column(
                children: [
                  SizedBox(height: 9.h),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Foodnames(),
                        SizedBox(height: 2.h),
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
                            SizedBox(width: Adaptive.w(13)),
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
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      shape: const CircleBorder(),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://source.unsplash.com/random/800x600?lunch&${Random().nextInt(600)}',
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

class OverflowCard2 extends StatelessWidget {
  const OverflowCard2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double circleRadius = 110.0;
    const double circleBorderWidth = 8.0;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: circleRadius / 2.0),
            child: Container(
              height: 15.h,
              width: Adaptive.w(78),
              decoration: BoxDecoration(
                color: const Color.fromARGB(253, 255, 255, 255),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(32, 32, 32, 0.15),
                    offset: Offset(0, 8),
                    blurRadius: 26,
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FoodnamesSmall(),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.5),
                              child: Icon(
                                Icons.star_rounded,
                                color: Colors.amber[600],
                                size: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.5),
                              child: Icon(
                                Icons.star_rounded,
                                color: Colors.amber[600],
                                size: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.5),
                              child: Icon(
                                Icons.star_rounded,
                                color: Colors.amber[600],
                                size: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.5),
                              child: Icon(
                                Icons.star_rounded,
                                color: Colors.amber[600],
                                size: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.5),
                              child: Icon(
                                Icons.star_rounded,
                                color: Colors.amber[600],
                                size: 16,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    'https://source.unsplash.com/random/800x600?faces&${Random().nextInt(700)}',
                                    height: 37,
                                    width: 37,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const MyText(
                                  text: 'By James Milner',
                                  color: Colors.black38,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            SizedBox(width: Adaptive.w(21)),
                            Row(
                              children: [
                                const Icon(SolarIconsOutline.alarm,
                                    size: 20, color: Colors.grey),
                                const SizedBox(width: 5),
                                MyText(
                                  text:
                                      '${(Random().nextInt(45) + 15).toString()} mins',
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
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
              padding: const EdgeInsets.all(circleBorderWidth),
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://source.unsplash.com/random/800x600?lunch&${Random().nextInt(500)}',
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
