import 'package:cookin/pages/pages.dart';
import 'package:cookin/utils/navigatio_bar.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';
import '../widget/widget.dart';
import '../apis/login_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Map<String, dynamic> _formData = {
    'email': '',
    'password': '',
  };
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
                          text: 'Hello,',
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                        MyText(
                          text: 'Welcome Back!',
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
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align contents to the left
                    children: [
                      const MyText(
                        text: 'Email',
                        fontSize: 18,
                      ),
                      InputBox(
                        height: 50,
                        borderRadius: 10,
                        placeHolder: '\t\tEnter Email',
                        marginVertical: 5,
                        onChanged: (value) => _formData['email'] = value,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyText(
                        text: 'Password',
                        fontSize: 18,
                      ),
                      InputBoxPassword(
                        height: 50,
                        borderRadius: 10,
                        isPassword: true,
                        placeHolder: '\t\tEnter Password',
                        marginVertical: 5,
                        onChanged: (value) => _formData['password'] = value,
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
                    height: 35,
                  ),
                  MyFilledButton(
                    color: Colors.white,
                    bgcolor: AppColors.primaryColor,
                    text: 'Sign In',
                    fontsize: 20,
                    page: const BottonNavBar(),
                    icon: SolarIconsOutline.arrowRight,
                    onPressed: () async {
                      final scaffoldContext = context; // Capture the context

                      User.authenticateUserAsync(_formData, 'signin')
                          .then((user) {
                            debugPrint('User: $user');
                        if (user == true) {
                          Navigator.push(scaffoldContext, MaterialPageRoute(
                            builder: (context) {
                              return const BottonNavBar();
                            },
                          ));
                        } else {
                          User.showFlashError(scaffoldContext, "email or password is incorrect");
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: 30,
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
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnchorTextButton(
                    text1: "Don't have an account?",
                    text2: 'Sign Up',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const CreateAccountPage();
                        },
                      ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
