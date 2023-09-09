import 'dart:math';

import 'package:cookin/utils/utils.dart';
import 'package:cookin/widget/text.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 370,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(217, 217, 217, 0.379),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyText(
                      text: 'New Recipe Alert!',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 1),
                    const Text(
                      "Try out our new pasta recipe! It's mouth\n-watering and full of flavor.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    const SizedBox(height: 5),
                    MyText(
                      text: '${(Random().nextInt(45) + 15).toString()} mins',
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.amber[200],
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    SolarIconsBold.fileText,
                    size: 20,
                    color: Colors.amber[600],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
