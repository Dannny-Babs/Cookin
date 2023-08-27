import 'dart:math';
import 'package:flutter/material.dart';

class Foodnames extends StatelessWidget {
  final List<String> foodNames = [
    'Sushi',
    'Pasta',
    'Salad',
    'Steak',
    'Seafood Paella',
    'Jollof Rice',
    'Miso Soup',
    'Ramen',
    'Tempura',
    'Sashimi',
    'Nigerian Suya',
    'Taco',
    'Pierogi',
    'Tandoori Chicken',
    'Shrimp Scampi',
    'Pho',
    'Tuna Tataki',
    'Gyros',
    'Pad Thai',
    'Samosa',
    'Dim Sum',
    'Chirashi Bowl',
    'Couscous',
    'Peking Duck',
  ];

  final Random random = Random();

  String generateMergedFoodName() {
    String randomFoodName1 = foodNames[random.nextInt(foodNames.length)];
    String randomFoodName2 = foodNames[random.nextInt(foodNames.length)];
    return '$randomFoodName1 $randomFoodName2';
  }

  @override
  Widget build(BuildContext context) {
    return Text(generateMergedFoodName());
  }
}
