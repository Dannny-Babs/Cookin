// ignore_for_file: non_constant_identifier_names

import 'package:cookin/pages/create_account.dart';
import 'package:cookin/pages/login_page.dart';
import 'package:cookin/utils/colors.dart';
import 'package:cookin/utils/navigatio_bar.dart';
import 'package:flutter/material.dart';
import 'package:cookin/widget/widget.dart';

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
        text: text,
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
        text: text,
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
    this.page = const LoginPage(),
    required this.bgcolor,
    this.icon,
    this.resppadding = 0.27,
    this.sizebox = 10,
    required this.text,
    this.fontsize = 24,
    this.fontweight = FontWeight.w500,
    this.Borderradius = 12,
  });
  final double sizebox;
  final page;
  final Color color;
  final Color bgcolor;
  final String text;
  final double resppadding;
  final double Borderradius;
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
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return widget.page;
          },
        ));
      },
      style: FilledButton.styleFrom(
        backgroundColor: widget.bgcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.Borderradius),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * widget.resppadding,
          vertical: MediaQuery.of(context).size.height *
              0.02, // Adjust the percentage as needed
        ),
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
          SizedBox(
            width: widget.sizebox,
          ),
          Icon(widget.icon, color: widget.color),
        ],
      ),
    );
  }
}

class MyFilledButtonSolo extends StatelessWidget {
  const MyFilledButtonSolo({
    super.key,
    required this.color,
    this.bgcolor = const Color(0xFFF5F5F5),
    this.resppadding = 0.06,
    this.sizebox = 10,
    required this.text,
    this.fontsize = 18,
    this.fontweight = FontWeight.normal,
    this.Borderradius = 12,
  });
  final double sizebox;

  final Color color;
  final Color bgcolor;
  final String text;
  final double resppadding;
  final double Borderradius;
  final fontweight;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          backgroundColor: bgcolor,
          surfaceTintColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Borderradius),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * resppadding,
            vertical: MediaQuery.of(context).size.height *
                0.008, // Adjust the percentage as needed
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: color, fontSize: fontsize, fontWeight: fontweight),
            ),
          ],
        ),
      ),
    );
  }
}

class IconButtonSolo extends StatefulWidget {
  const IconButtonSolo({
    super.key,
    required this.color,
    this.radius = 8,
    required this.icon,
    this.iconsize = 20,
    this.padding = 5,
  });

  final Color color;
  final double radius;
  final icon;
  final double iconsize;
  final double padding;

  @override
  State<IconButtonSolo> createState() => _IconButtonSoloState();
}

class _IconButtonSoloState extends State<IconButtonSolo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(widget.radius), // Border radius of 5
        border: Border.all(color: Colors.grey, width: 1.3),
        // Grey color
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        padding: EdgeInsets.all(widget.padding), // Padding of 10 for all sides
        iconSize: widget.iconsize, // Size of the icon
        icon: Icon(
          widget.icon, // Icon is arrow_ios_rounded
          color: widget.color, // White color for the icon
        ),
      ),
    );
  }
}

class AnchorTextButton extends StatelessWidget {
  const AnchorTextButton({
    super.key,
    this.fontsize = 14,
    this.color1 = Colors.black87,
    this.color2 = Colors.amber,
    required this.text1,
    required this.text2,
    this.page = const CreateAccountPage(),
  });
  final double fontsize;
  final String text1;
  final String text2;
  final page;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return page;
          },
        ));
      },
      child: RichText(
        text: TextSpan(
          style:
              DefaultTextStyle.of(context).style.copyWith(fontSize: fontsize),
          children: [
            TextSpan(
                text: text1,
                style: TextStyle(
                  color: color1,
                  fontSize: fontsize, // Amber color
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                )),
            TextSpan(
              text: text2,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color2, // Amber color
                decoration: TextDecoration.none,
                fontFamily: 'Poppins', // No underline
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Icon_Button extends StatefulWidget {
  const Icon_Button({
    super.key,
    required this.color,
    this.radius = 10,
    required this.icon,
    this.iconsize = 24,
    this.flex = 1,
    this.padding = 10,
  });

  final Color color;
  final double radius;
  final int flex;
  final icon;
  final double iconsize;
  final double padding;

  @override
  State<Icon_Button> createState() => _Icon_ButtonState();
}

class _Icon_ButtonState extends State<Icon_Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(widget.radius), // Border radius of 5
        color: AppColors.primaryColor,

        // Grey color
      ),
      child: IconButton(
        onPressed: () {},
        padding: EdgeInsets.all(widget.padding), // Padding of 10 for all sides
        iconSize: widget.iconsize, // Size of the icon
        icon: Icon(
          widget.icon, // Icon is arrow_ios_rounded
          color: widget.color, // White color for the icon
        ),
      ),
    );
  }
}

class MyFilledBtn extends StatelessWidget {
  const MyFilledBtn({
    super.key,
    required this.color,
    this.bgcolor = const Color(0xFFF5F5F5),
    this.resppadding = 0.06,
    this.sizebox = 10,
    this.page = const BottonNavBar(),
    required this.text,
    this.fontsize = 18,
    this.fontweight = FontWeight.normal,
    this.Borderradius = 12,
    required this.navigateToNextPage, // Add this parameter
  });
  // ignore: prefer_typing_uninitialized_variables
  final page;
  final double sizebox;
  final Color color;
  final Color bgcolor;
  final String text;
  final double resppadding;

  final double Borderradius;
  final FontWeight fontweight;
  final double fontsize;
  final bool navigateToNextPage; // Add this parameter

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: FilledButton(
        onPressed: () {
          if (navigateToNextPage) {
            Navigator.pop(context); // Navigate back
          } else {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return page;
              },
            ));
          }
        },
        style: FilledButton.styleFrom(
          backgroundColor: bgcolor,
          surfaceTintColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Borderradius),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * resppadding,
            vertical: MediaQuery.of(context).size.height * 0.008,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: fontsize,
                fontWeight: fontweight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyOutlinedButton extends StatelessWidget {
  final Color color;
  final Color bgcolor;
  final double width;
  final String text;
  const MyOutlinedButton(
      {Key? key,
      required this.color,
      required this.bgcolor,
      required this.width,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: this.width, color: AppColors.primaryColor),
        color: this.color,
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Text(
        this.text,
        style: TextStyle(color: this.bgcolor, fontSize: 14),
      ),
    );
  }
}

class MyOutlinedButton2 extends StatelessWidget {
  final Color color;
  final Color bgcolor;
  final double width;
  final String text;
  const MyOutlinedButton2(
      {Key? key,
      required this.color,
      required this.bgcolor,
      required this.width,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: this.width, color: AppColors.primaryColor),
        color: this.color,
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Row(
        children: [
          Text(
            this.text,
            style: TextStyle(color: this.bgcolor, fontSize: 14),
          ),
          SizedBox(
            width: 1,
          ),
          Icon(
            Icons.star_rounded,
            color: this.bgcolor,
          )
        ],
      ),
    );
  }
}
