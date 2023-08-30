import 'package:cookin/widget/text.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: Color.fromARGB(255, 217, 217, 217),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: 'New Recipe Alert!',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                Text(
                  "Try out our new pasta recipe! It's absolutely\n mouth-watering  and full of flavor. ",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
