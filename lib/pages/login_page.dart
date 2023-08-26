import 'package:cookin/widget/input_box.dart';
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
                        Text(
                          'Hello,',
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ),
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
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 18,
                        ),
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
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align contents to the left
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 18,
                        ),
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
                  FilledButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SignUpPage();
                        },
                      ));
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF129575), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.fromLTRB(
                          120, 15, 120, 15), // Padding
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(SolarIconsOutline.arrowRight,
                            color: Colors.white), // Icon with default styling
                      ],
                    ),
                  ),
                  Row(
                    
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
