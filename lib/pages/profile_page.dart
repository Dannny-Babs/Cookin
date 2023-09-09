import 'package:cookin/utils/colors.dart';
import 'package:cookin/widget/button.dart';
import 'package:cookin/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 110, 110, 110),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        MyText(
                          text: 'Profile',
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        Spacer(), // Adds space between the text and button
                        RajiFilledButtonSolo(
                          color: AppColors.primaryColor,
                          text: 'Edit Profile',
                          fontweight: FontWeight.w300,
                          fontsize: 14,
                          bgcolor: AppColors.white,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      child: Image.asset('images/profile.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const MyText(
                      text: 'Muzzamil Raji',
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                    const MyText(
                      text: 'Chef',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: AppColors.secondaryColor,
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(32, 56, 56, 56),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: 'About',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          MyText(
                            text: 'I am a chef \n lolz  ',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Icon(SolarIconsOutline.questionCircle,
                              color: Colors.black54),
                          SizedBox(
                            width: 15,
                          ),
                          MyText(
                            text: 'Help & Support',
                            fontSize: 18,
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black12,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Icon(SolarIconsOutline.chatSquareCall,
                              color: Colors.black54),
                          SizedBox(
                            width: 15,
                          ),
                          MyText(
                            text: 'Feedback',
                            fontSize: 18,
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black12,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Icon(SolarIconsOutline.shieldUser,
                              color: Colors.black54),
                          SizedBox(
                            width: 15,
                          ),
                          MyText(
                            text: 'Legal',
                            fontSize: 18,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Icon(SolarIconsOutline.logout_2,
                              color: Colors.black54),
                          SizedBox(
                            width: 15,
                          ),
                          MyText(
                            text: 'Logout',
                            fontSize: 18,
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black12,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Icon(SolarIconsOutline.trashBinTrash,
                              color: Colors.red),
                          SizedBox(
                            width: 15,
                          ),
                          MyText(
                            text: 'Delete Account',
                            fontSize: 18,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
