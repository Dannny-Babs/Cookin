import 'package:cookin/pages/create_account.dart';
import 'package:cookin/pages/home_page.dart';
import 'package:cookin/pages/login_page.dart';
import 'package:cookin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:solar_icons/solar_icons.dart';

class BottonNavBar extends StatefulWidget {
  const BottonNavBar({super.key});

  @override
  State<BottonNavBar> createState() => _BottonNavBarState();
}

class _BottonNavBarState extends State<BottonNavBar> {
  int _selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    LoginPage(),
    CreateAccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.amber,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
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
    );
  }
}
