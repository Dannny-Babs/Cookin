import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'text.dart';

class InputBox extends StatefulWidget {
  const InputBox({
    super.key,
    this.height = 60,
    this.width = 330,
    this.placeHolder = 'Email',
    this.borderRadius = 12,
    this.marginVertical = 6,
  });
  final double height;
  final double width;
  final String placeHolder;
  final double borderRadius;
  final double marginVertical;

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.marginVertical),
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 14),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.2,
                color: Color.fromARGB(255, 200, 208, 210),
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.2,
                color: Color.fromRGBO(188, 202, 206, 1),
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            hintText: widget.placeHolder,
          ),
        ),
      ),
    );
  }
}

class InputBoxPassword extends StatefulWidget {
  const InputBoxPassword({
    super.key,
    this.height = 50,
    this.width = 330,
    this.placeHolder = 'Email',
    this.borderRadius = 12,
    this.marginVertical = 6,
    this.isPassword = false,
  });
  final double height;
  final double width;
  final String placeHolder;
  final double borderRadius;
  final double marginVertical;
  final bool isPassword;

  @override
  _InputBoxPasswordState createState() => _InputBoxPasswordState();
}

class _InputBoxPasswordState extends State<InputBoxPassword> {
  bool passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.marginVertical),
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 14),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(passwordVisibility
                        ? SolarIconsOutline.eye
                        : SolarIconsOutline.eyeClosed),
                    onPressed: () {
                      setState(() {
                        passwordVisibility = !passwordVisibility;
                      });
                    },
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.2,
                color: Color.fromARGB(255, 200, 208, 210),
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.2,
                color: Color.fromRGBO(188, 202, 206, 1),
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            hintText: widget.placeHolder,
          ),
          obscureText: passwordVisibility,
        ),
      ),
    );
  }
}

class InputWithLabel extends StatelessWidget {
  const InputWithLabel({
    super.key,
    this.height = 50,
    this.width = 330,
    this.placeHolder = 'Email',
    this.borderRadius = 12,
    this.marginVertical = 6,
    this.label = 'Email',
    this.isPassword = false,
  });
  final double height;
  final double width;
  final String placeHolder;
  final double borderRadius;
  final double marginVertical;
  final bool isPassword;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            label,
            fontSize: 18,
          ),
          isPassword
              ? InputBoxPassword(
                  height: height,
                  width: width,
                  placeHolder: placeHolder,
                  borderRadius: borderRadius,
                  marginVertical: marginVertical,
                )
              : InputBox(
                  height: height,
                  width: width,
                  placeHolder: placeHolder,
                  borderRadius: borderRadius,
                  marginVertical: marginVertical,
                ),
        ],
      ),
    );
  }
}
