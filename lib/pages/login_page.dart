import 'package:cookin/utils/colors.dart';
import 'package:cookin/widget/button.dart';
import 'package:cookin/widget/divider.dart';
import 'package:cookin/widget/input_box.dart';
import 'package:cookin/widget/text.dart';
import 'package:dev_icons/dev_icons.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the left
                      children: [
                        MyText(
                          'Hello,',
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                        MyText(
                          'Welcome Back!',
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  const Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align contents to the left
                    children: [
                      MyText(
                        'Email',
                        fontSize: 18,
                      ),
                      InputBox(
                        height: 50,
                        borderRadius: 10,
                        placeHolder: 'Enter Email',
                        width: 330,
                        marginVertical: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        'Password',
                        fontSize: 18,
                      ),
                      InputBoxPassword(
                        height: 50,
                        borderRadius: 10,
                        isPassword: true,
                        placeHolder: 'Enter Password',
                        width: 330,
                        marginVertical: 5,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  
                  const SizedBox(
                    height: 20,
                  ),
                  const myDivider(
                      text: 'Or Sign in with',
                      flex: 2,
                      fontsize: 16,
                      fontweight: FontWeight.w400,
                      height: 0.8),
                  const SizedBox(
                    height: 30,
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
                        color: AppColors.blue,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
