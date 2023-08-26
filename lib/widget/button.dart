import 'package:dev_icons/dev_icons.dart';
import 'package:flutter/material.dart';
import 'package:cookin/widget/widget.dart';
import 'package:solar_icons/solar_icons.dart';

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
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ),
        // );
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
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => \),
        // );
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
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class MyIconButton extends StatefulWidget {
  const MyIconButton({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
  });
  final Color color;
  final String text;
  final icon;

  @override
  State<MyIconButton> createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(
        widget.icon,
        color: widget.color,
      ),
      label: Text(
        widget.text,
        style: TextStyle(
          color: widget.color,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: widget.color,
        ), // Border color
      ),
    );
  }
}

class MyFilledButton extends StatefulWidget {
  const MyFilledButton({
    super.key,
    required this.color,
    required this.bgcolor,
    this.icon,
    required this.text,
    required this.horizontalpadding,
    required this.verticalpadding,
    required this.fontsize,
    required this.fontweight,
    required this.Borderradius,
  });
  final Color color;
  final Color bgcolor;
  final String text;
  final double horizontalpadding;
  final double verticalpadding;
  final Borderradius;
  final fontweight;
  final double fontsize;
  final icon;

  @override
  State<MyFilledButton> createState() => _MyFilledButtonState();
}

class _MyFilledButtonState extends State<MyFilledButton> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: FilledButton.styleFrom(
        backgroundColor: widget.bgcolor, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.Borderradius),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalpadding,
          vertical: widget.verticalpadding,
        ), // Padding
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.text,
            style: TextStyle(
                color: widget.color,
                fontSize: widget.fontsize,
                fontWeight: widget.fontweight),
          ),
          const SizedBox(
            width: 15,
          ),
          Icon(widget.icon, color: widget.color), // Icon with default styling
        ],
      ),
    );
  }
}
