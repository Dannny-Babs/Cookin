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

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: circleRadius / 2.0),
            child: Container(
              height: height * .26,
              width: width / 2,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: const Color.fromRGBO(217, 217, 217, 0.5),
              ),

              child: Column(
                children: [
                  const SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Foodnames(),
                        const SizedBox(height: 2),
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
                            const SizedBox(width: 55),
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
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.black26),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1600335895229-6e75511892c8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bHVuY2h8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: 220,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: circleRadius / 2.0),
            child: Container(
              height: height * .15,
              width: width * .9,
              decoration: BoxDecoration(
                color: const Color.fromARGB(253, 255, 255, 255),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(32, 32, 32, 0.12),
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
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1582233479366-6d38bc390a08?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFjZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
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
                            const SizedBox(width: 90),
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
                  color: Color.fromRGBO(32, 32, 32, 0.064),
                  offset: Offset(0, 8),
                  blurRadius: 26,
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.all(circleBorderWidth),
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.black26),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1600335895229-6e75511892c8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bHVuY2h8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
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

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: AssetImage("images/food.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              const Color.fromRGBO(0, 0, 0, 0.3), // Semi-transparent black
              Colors.black.withOpacity(0.7), // Solid black
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 50,
                  height: 25,
                  child: StarRatingWidget(),
                ),
              ),
              const SizedBox(
                height: 115, // Adjust the height as needed
              ),
              Row(
                children: [
                  SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FoodnamesSmall2(),
                        const MyText(
                          text: 'By Chef Dammy',
                          fontSize: 12,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Adaptive.w(5),
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(SolarIconsOutline.alarm,
                            size: 20, color: Colors.white70),
                        const SizedBox(width: 5),
                        MyText(
                          text:
                              '${(Random().nextInt(45) + 15).toString()} mins',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          width: 0.5.h,
                        ),
                        IconButton.filled(
                          onPressed: () {},
                          icon: const Icon(SolarIconsBold.bookmark),
                          iconSize: 18,
                          color: AppColors.primaryColor,
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
