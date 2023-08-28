// ignore_for_file: unused_import

import 'package:cookin/pages/home_page.dart';
import 'package:cookin/pages/pages.dart';
import '../utils/navigatio_bar.dart';
import '../utils/utils.dart';
import 'package:flutter/material.dart';
import '../widget/widget.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  //   IconButtonSolo(
                  //     color: Colors.black38,
                  //    icon: Icons.arrow_back_ios_new_rounded,
                  //   ),
                  SizedBox(height: 20),
                  MyText(
                    text: "Create an account",
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                  SizedBox(height: 5),
                  MyText(
                    text:
                        "Let’s help you set up your account,\nit won’t take long.",
                    fontSize: 16,
                  ),
                  SizedBox(height: 60),
                  InputWithLabel(
                    label: "Name",
                    placeHolder: "John Doe",
                    height: 50,
                  ),
                  InputWithLabel(
                    label: "Email",
                    placeHolder: "Enter Email",
                    height: 50,
                  ),
                  InputWithLabel(
                    label: "Password",
                    placeHolder: " Enter your Password",
                    isPassword: true,
                    height: 50,
                  ),
                  InputWithLabel(
                    label: "Confirm Password",
                    placeHolder: "Confirm Password",
                    isPassword: true,
                    height: 50,
                  ),
                  SizedBox(height: 5),
                  CheckBox("Accept terms & Condition"),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: MyFilledButton(
                      color: Colors.white,
                      bgcolor: AppColors.primaryColor,
                      text: 'Sign Up',
                      fontsize: 22,
                      page: BottonNavBar(),
                      resppadding: 0.29,
                      sizebox: 5,
                      icon: SolarIconsOutline.arrowRight,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  myDivider(
                      text: 'Or Sign in with',
                      flex: 2,
                      fontsize: 16,
                      fontweight: FontWeight.w400,
                      height: 0.8),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyIconButton(
                        icon: DevIcons.googlePlain,
                        text: 'Google',
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(width: 10), // Add spacing between buttons
                      MyIconButton(
                        icon: DevIcons.facebookPlain,
                        text: 'Facebook',
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: AnchorTextButton(
                      text1: 'Already a member? ',
                      text2: 'Login',
                      page: LoginPage(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
