import 'package:cookin/utils/utils.dart';
import 'package:cookin/widget/notification_alert.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

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
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
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
          ),
        ),
      )),
    );
  }
}
