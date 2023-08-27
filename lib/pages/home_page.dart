import 'package:cookin/widget/widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                MyText(
                  'Hello Jega👋',
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                MyText(
                  'What are you cooking today?',
                  color: Colors.black12,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
