import 'package:flutter/material.dart';
import 'package:life_line/utils/utils.dart';

class MyText extends StatelessWidget {
  const MyText(
    this.text, {
    super.key,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 18,
    this.color = AppColors.textColor,
    this.fontFamily = "Satoshi",
  });
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}

class MyRichText extends StatelessWidget {
  const MyRichText({
    super.key,
    required this.boldText,
    this.text =
        "Please enter the verification code sent to your\n email address: ",
  });
  final String boldText;
  final String text;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
           TextSpan(text: text),
          TextSpan(
            text: boldText,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
