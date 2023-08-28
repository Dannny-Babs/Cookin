import 'package:flutter/material.dart';
import 'package:cookin/widget/widget.dart';
import 'package:cookin/utils/utils.dart';

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
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isChecked ? AppColors.secondaryColor : AppColors.white,
              border: Border.all(color: AppColors.secondaryColor), // Optional border
              borderRadius: BorderRadius.circular(6),
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
         text: widget.text,
          fontSize: 16,
          color: AppColors.secondaryColor,
        ),
      ],
    );
  }
}
