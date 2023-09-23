import 'package:cookin/pages/start_screen.dart';

import 'package:cookin/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cookin',
          theme: ThemeData(
            useMaterial3: true,
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
                .copyWith(background: AppColors.white),
          ),
          home: const startScreen(),
        );
      },
    );
  }
}

/*
Platform  Firebase App Id
web       1:125095256640:web:0c11e497302e50c0f4b5a5
android   1:125095256640:android:8c9b06fce4d89b68f4b5a5
ios       1:125095256640:ios:afb65e9c0bdfe315f4b5a5
macos     1:125095256640:ios:d39a6b05afba1ce1f4b5a5 */