import 'package:cookin/utils/colors.dart';

import 'package:cookin/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:solar_icons/solar_icons.dart';

class OverflowCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  const OverflowCard({
    super.key,
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    const double circleRadius = 150.0;
    const double circleBorderWidth = 8.0;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: circleRadius / 2.0),
            child: Container(
              height: 200,
              width: 180,
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
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 20.0,
                            height: 1.2,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 2.1.h),
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
                                  text: cookTime,
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            const Spacer(),
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
                  padding: const EdgeInsets.all(circleBorderWidth),
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      shape: const CircleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(66, 164, 164, 164)),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(thumbnailUrl),
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
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amber[200],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.004,
                          horizontal: size.height * 0.008),
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
                              rating, // Display the rating with one decimal place
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
                  ),
                ), // Place your overlay widget here
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OverflowCard2 extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  const OverflowCard2({
    super.key,
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    const double circleRadius = 110.0;
    const double circleBorderWidth = 8.0;

    return Container(
      height: 220,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: circleRadius / 2.0),
            child: Container(
              height: 115,
              width: 330,
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
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
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
                                    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGZhY2VzfGVufDB8fDB8fHww&auto=format&fit=cover&w=800&q=60',
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
                            const Spacer(),
                            Row(
                              children: [
                                const Icon(SolarIconsOutline.alarm,
                                    size: 20, color: Colors.grey),
                                const SizedBox(width: 5),
                                MyText(
                                  text: cookTime,
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
            child: Padding(
              padding: const EdgeInsets.all(circleBorderWidth),
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  shape: const CircleBorder(
                    side: BorderSide(color: Colors.black26),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(thumbnailUrl),
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
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  final bool isLoading; // Add a boolean flag to control the shimmer effect

  const FoodCard({
    Key? key,
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
    required this.isLoading, // Pass the isLoading flag as a parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Actual content
        Container(
          width: 370,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(thumbnailUrl),
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
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber[200],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.004,
                              horizontal: size.height * 0.008),
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
                                  rating, // Display the rating with one decimal place
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
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 115, // Adjust the height as needed
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 8,
                        child: SizedBox(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: title,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              const MyText(
                                text: 'By Chef Dammy',
                                fontSize: 12,
                                color: AppColors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              SolarIconsOutline.alarm,
                              size: 18,
                              color: Colors.white70,
                            ),
                            const SizedBox(width: 5),
                            MyText(
                              text: cookTime,
                              color: Colors.white,
                              fontSize: 14,
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
        ),
        // Shimmer effect overlaid on top when isLoading is true
        if (isLoading)
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors
                    .grey[300], // Use a placeholder color while shimmering
              ),
            ),
          ),
      ],
    );
  }
}

class FoodCard2 extends StatelessWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;

  const FoodCard2({
    Key? key,
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: 200, // Set the height to 200
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(thumbnailUrl),
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[200],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.004,
                        horizontal: size.height * 0.008,
                      ),
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
                              rating,
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
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 8,
                    child: SizedBox(
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: title,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          const MyText(
                            text: 'By Chef Dammy',
                            fontSize: 12,
                            color: AppColors.white,
                          ),
                        ],
                      ),
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

class IngredientCard extends StatelessWidget {
  const IngredientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(217, 217, 217, 0.498),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGZhY2VzfGVufDB8fDB8fHww&auto=format&fit=cover&w=800&q=60'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Ingredient',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 5),
              MyText(
                text: '1 cup of rice',
                fontSize: 12,
                color: Colors.black54,
              ),
            ],
          ),
          const Spacer(),
          const MyText(
            text: '300g',
            fontSize: 18,
            color: Colors.black54,
          )
        ],
      ),
    );
  }
}
