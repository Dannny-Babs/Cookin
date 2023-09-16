// ignore_for_file: non_constant_identifier_names

import 'package:cookin/utils/utils.dart';
import 'package:cookin/widget/categories.dart';
import 'package:cookin/widget/notification_alert.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class RecipePage extends StatefulWidget {
  const RecipePage({
    super.key,
  });

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(SolarIconsOutline.arrowLeft),
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 3,
        shadowColor: Colors.black26,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Snackbar'),
                  duration: Duration(milliseconds: 1000),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(SolarIconsBold.menuDots),
            style: IconButton.styleFrom(focusColor: Colors.deepPurpleAccent),
          ),
        ],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Categories(),
            NotificationCard(),
            NotificationCard(),
            NotificationCard(),
            NotificationCard(),
            NotificationCard(),
            NotificationCard(),
            NotificationCard(),
            NotificationCard(),
            NotificationCard(),
          ],
        )),
      ),
    );
  }
}
