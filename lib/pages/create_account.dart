import 'package:cookin/widget/widget.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                MyText(
                  "Create an account",
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
                 SizedBox(height: 5),
                MyText(
                  "Let’s help you set up your account,\nit won’t take long.",
                  fontSize: 16,
                ),
                SizedBox(height: 30),
                InputWithLabel(
                  label: "Name",
                  placeHolder: "Name",
                ),
                InputWithLabel(
                  label: "Email",
                  placeHolder: "Email",
                ),
                InputWithLabel(
                  label: "Password",
                  placeHolder: "Password",
                  isPassword: true,
                ),
                InputWithLabel(
                  label: "Confirm Password",
                  placeHolder: "Confirm Password",
                  isPassword: true,
                ),
                 SizedBox(height: 10),
                CheckBox("Accept terms & Condition")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
