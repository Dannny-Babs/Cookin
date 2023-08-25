import 'package:flutter/material.dart';
import 'package:life_line/widget/widget.dart';
import 'package:life_line/utils/utils.dart';

class CheckBox extends StatefulWidget {
  const CheckBox(
    this.text, {
    super.key,
  });
  final String text;

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: isChecked ? AppColors.red : AppColors.white,
              border: Border.all(color: AppColors.textColor), // Optional border
              borderRadius: BorderRadius.circular(0),
            ),
            child: isChecked
                ? const Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 15,
                  )
                : null,
          ),
        ),
       const SizedBox(width: 8), // Add some spacing
        MyText(
          widget.text,
          fontSize: 16,
        ),
      ],
    );
  }
}
