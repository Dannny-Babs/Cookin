import 'package:flutter/material.dart';
import 'package:life_line/screens/screens.dart';
import 'package:life_line/widget/widget.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderWidth = 0,
    this.vertical = 10.0,
    this.horizontal = 130.0,
    this.backgroundColor = const Color(0xFFB00005),
    this.textColor = const Color(0xFFFFFFFF),
  });

  final Color backgroundColor;
  final Color textColor;
  final String text;
  final double borderWidth;
  final double vertical;
  final double horizontal;
  final VoidCallback onPressed;

  factory Button.signup(BuildContext context) {
    return Button(
      text: "Sign Up",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateAccountPage()),
        );
      },
    );
  }
  factory Button.login(BuildContext context) {
    return Button(
      backgroundColor: const Color(0xFFFFFFFF),
      text: "Log In",
      textColor: const Color(0xFF000000),
      borderWidth: 1,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
    );
  }

  ButtonStyle getButtonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        ),
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(width: borderWidth, color: const Color(0xFFC8D9DE))),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: getButtonStyle(),
      onPressed: onPressed,
      child: MyText(
        text,
        color: textColor,
        fontSize: 19,
      ),
    );
  }
}

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    required this.icon,
    required this.text,
    this.borderWidth = 1,
    this.vertical = 10.0,
    this.horizontal = 100.0,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.textColor = const Color.fromARGB(255, 0, 0, 0),
  });

  final Color backgroundColor;
  final Color textColor;
  final String text;
  final double borderWidth;
  final double vertical;
  final double horizontal;
  final dynamic icon;

  ButtonStyle getButtonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        ),
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(width: borderWidth, color: const Color(0xFFC8D9DE))),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: getButtonStyle(),
      onPressed: () {},
      icon: icon,
      label: MyText(
        text,
        color: textColor,
        fontSize: 13,
      ),
    );
  }
}
