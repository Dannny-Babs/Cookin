import 'package:cookin/utils/colors.dart';
import 'package:flutter/material.dart';

class startScreen extends StatelessWidget {
  const startScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Cookin'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('images/Icon.png'),
            const Text(
              'Home of Premium Recipe',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.offWhite,
                  fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
