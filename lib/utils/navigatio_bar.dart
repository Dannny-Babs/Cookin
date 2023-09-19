import 'package:cookin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../pages/pages.dart';

class BottonNavBar extends StatefulWidget {
  const BottonNavBar({super.key});

  @override
  State<BottonNavBar> createState() => _BottonNavBarState();
}

class _BottonNavBarState extends State<BottonNavBar> {
  int _selectedIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const SavedPage(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 9.h, // Set height to 120px
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(32, 32, 32, 0.292), offset: Offset(0, -4),
              blurRadius: 3, // Box shadow blur
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: const Color.fromRGBO(85, 127, 116, 0.741),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  SolarIconsOutline.home,
                ),
                activeIcon: Icon(
                  SolarIconsBold.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  SolarIconsOutline.bookmark,
                ),
                activeIcon: Icon(
                  SolarIconsBold.bookmark,
                ),
                label: 'Saved',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  SolarIconsOutline.notificationUnread,
                ),
                activeIcon: Icon(
                  SolarIconsBold.notificationUnreadLines,
                ),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  SolarIconsOutline.user,
                ),
                activeIcon: Icon(
                  SolarIconsBold.user,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
