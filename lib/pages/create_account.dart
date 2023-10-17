// ignore_for_file: unused_import

import 'package:cookin/pages/home_page.dart';
import 'package:cookin/pages/pages.dart';
import '../utils/navigatio_bar.dart';
import '../utils/utils.dart';
import 'package:flutter/material.dart';
import '../widget/widget.dart';
import '../apis/login_api.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> _formData = {
      'name': '',
      'email': '',
      'password': '',
      'confirmPassword': '',
    };
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  //   IconButtonSolo(
                  //     color: Colors.black38,
                  //    icon: Icons.arrow_back_ios_new_rounded,
                  //   ),
                  const SizedBox(height: 20),
                  const MyText(
                    text: "Create an account",
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                  const SizedBox(height: 5),
                  const MyText(
                    text:
                        "Let’s help you set up your account,\nit won’t take long.",
                    fontSize: 16,
                  ),
                  const SizedBox(height: 60),
                  InputWithLabel(
                    label: "Name",
                    placeHolder: "John Doe",
                    height: 50,
                    onChanged: (value) {
                      _formData['name'] = value;
                    },
                  ),
                  InputWithLabel(
                    label: "Email",
                    placeHolder: "Enter Email",
                    height: 50,
                    onChanged: (value) {
                      _formData['email'] = value;
                    },
                  ),
                  InputWithLabel(
                    label: "Password",
                    placeHolder: " Enter your Password",
                    isPassword: true,
                    height: 50,
                    onChanged: (value) {
                      _formData['password'] = value;
                    },
                  ),
                  InputWithLabel(
                    label: "Confirm Password",
                    placeHolder: "Confirm Password",
                    isPassword: true,
                    height: 50,
                    onChanged: (value) {
                      _formData['confirmPassword'] = value;
                    },
                  ),
                  const SizedBox(height: 5),
                  const CheckBox("Accept terms & Condition"),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: MyFilledButton(
                      color: Colors.white,
                      bgcolor: AppColors.primaryColor,
                      text: 'Sign Up',
                      fontsize: 22,
                      page: const BottonNavBar(),
                      resppadding: 0.29,
                      sizebox: 5,
                      onPressed: () async {
                        final scaffoldContext = context; // Capture the context
                        if(_formData['password'] != _formData['confirmPassword']) {
                          User.showFlashError(scaffoldContext,
                              "passwords do not match");
                          return;
                        }
                        if(_formData['name'] == '' || _formData['email'] == '' || _formData['password'] == '' || _formData['confirmPassword'] == '') {
                          User.showFlashError(scaffoldContext,
                              "please fill all field");
                          return;
                        }
                        User.createUserAsync(_formData)
                            .then((user) {
                          debugPrint('User: $user');
                          if (user == true) {
                            Navigator.push(scaffoldContext, MaterialPageRoute(
                              builder: (context) {
                                return const BottonNavBar();
                              },
                            ));
                          } else {
                            User.showFlashError(scaffoldContext,
                                "email alread exists");
                          }
                        });
                      },
                      icon: SolarIconsOutline.arrowRight,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const myDivider(
                      text: 'Or Sign in with',
                      flex: 2,
                      fontsize: 16,
                      fontweight: FontWeight.w400,
                      height: 0.8),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
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
