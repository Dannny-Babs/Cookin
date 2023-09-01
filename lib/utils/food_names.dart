import 'dart:math';
import 'package:flutter/material.dart';

class Foodnames extends StatelessWidget {
  final List<String> foodNames = [
    'Sushi',
    'Pasta',
    'Salad',
    'Steak',
    'Seafood',
    'Paella',
    'Jollof ',
    'Miso Soup',
    'Ramen',
    'Tempura',
    'Sashimi',
    'Suya',
    'Shrimp',
    'Taco',
    'Pierogi',
    'Tandoori',
    'Chicken',
    'Scampi',
    'Pho',
    'Tuna',
    'Tataki',
    'Gyros',
    'Pad Thai',
    'Samosa',
    'Dim Sum',
    'Chirashi',
    'Couscous',
    'Peking',
  ];

  final Random random = Random();

  Foodnames({super.key});

  String generateMergedFoodName() {
    String randomFoodName1 = foodNames[random.nextInt(foodNames.length)];
    String randomFoodName2 = foodNames[random.nextInt(foodNames.length)];
    String randomFoodName3 = foodNames[random.nextInt(foodNames.length)];
    String randomFoodName4 = foodNames[random.nextInt(foodNames.length)];
    return '$randomFoodName1 $randomFoodName2 \n $randomFoodName3 $randomFoodName4';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      generateMergedFoodName(),
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontFamily: 'Poppins'),
    );
  }
}

class FoodnamesSmall extends StatelessWidget {
  final List<String> foodNames = [
    'Sushi',
    'Pasta',
    'Salad',
    'Steak',
    'Seafood',
    'Paella',
    'Jollof',
    'Miso Soup',
    'Ramen',
    'Tempura',
    'Sashimi',
    'Suya',
    'Shrimp',
    'Taco',
    'Pierogi',
    'Tandoori',
    'Chicken',
    'Scampi',
    'Pho',
    'Tuna',
    'Tataki',
    'Gyros',
    'Pad Thai',
    'Samosa',
    'Dim Sum',
    'Chirashi',
    'Couscous',
    'Peking',
  ];

  final Random random = Random();

  FoodnamesSmall({super.key});

  String generateMergedFoodName() {
    String randomFoodName1 = foodNames[random.nextInt(foodNames.length)];
    String randomFoodName2 = foodNames[random.nextInt(foodNames.length)];
    String randomFoodName3 = foodNames[random.nextInt(foodNames.length)];

    return '$randomFoodName1 $randomFoodName2 $randomFoodName3 ';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      generateMergedFoodName(),
      textAlign: TextAlign.center,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: 'Poppins',
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class FoodnamesSmall2 extends StatelessWidget {
  final List<String> foodNames = [
    'Sushi',
    'Pasta',
    'Salad',
    'Steak',
    'Seafood',
    'Paella',
    'Jollof ',
    'Miso Soup',
    'Ramen',
    'Tempura',
    'Sashimi',
    'Suya',
    'Shrimp',
    'Taco',
    'Pierogi',
    'Tandoori',
    'Chicken',
    'Scampi',
    'Pho',
    'Tuna',
    'Tataki',
    'Gyros',
    'Pad Thai',
    'Samosa',
    'Dim Sum',
    'Chirashi',
    'Couscous',
    'Peking',
  ];

  final Random random = Random();

  FoodnamesSmall2({super.key});

  String generateMergedFoodName() {
    String randomFoodName1 = foodNames[random.nextInt(foodNames.length)];
    String randomFoodName2 = foodNames[random.nextInt(foodNames.length)];
    

    return '$randomFoodName1 $randomFoodName2';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      generateMergedFoodName(),
      textAlign: TextAlign.center,
      maxLines: 1,
      style: const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 255, 255, 255),
        fontFamily: 'Poppins',
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
