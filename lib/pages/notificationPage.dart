// ignore_for_file: file_names

import 'package:cookin/utils/utils.dart';
import 'package:cookin/widget/notification_alert.dart';
import 'package:cookin/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyText(
                text: 'Notifications',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  const MyFilledButtonSolo(
                    color: Colors.white,
                    bgcolor: AppColors.primaryColor,
                    text: 'All',
                  ),
                  SizedBox(
                    width: 2.h,
                  ),
                  const MyFilledButtonSolo(
                    bgcolor: Colors.white,
                    color: AppColors.primaryColor,
                    text: 'Read',
                    resppadding: 0.03,
                  ),
                  SizedBox(
                    width: 2.h,
                  ),
                  const MyFilledButtonSolo(
                    bgcolor: Colors.white,
                    color: AppColors.primaryColor,
                    text: 'Unread',
                    resppadding: 0.03,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const MyText(
                text: 'Today',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10,
              ),
              const NotificationCard(),
              const NotificationCard(),
              const NotificationCard(),
              const NotificationCard(),
              const SizedBox(
                height: 20,
              ),
              const MyText(
                text: 'Yesterday',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10,
              ),
              const NotificationCard(),
              const NotificationCard(),
              const NotificationCard(),
              const NotificationCard(),
            ],
          ),
        ),
      )),
    );
  }
}
