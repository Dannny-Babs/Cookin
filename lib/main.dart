import 'package:cookin/pages/pages.dart';
import 'package:cookin/pages/search_page.dart';
import 'package:cookin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
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
          home: const SearchPage(),
        );
      },
    );
  }
}
