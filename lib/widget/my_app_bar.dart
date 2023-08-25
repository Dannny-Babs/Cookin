import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key, // Corrected the parameter name to 'Key? key'
    this.image = const AssetImage('assets/background/bg.png'),
    this.scaleY = 1.9,
    this.paddingBottom = 30,
    this.paddingRight = 0,
    this.noBackButton = false,
  }) : super(key: key); 

  final AssetImage image;
  final double scaleY;
  final double paddingBottom;
  final double paddingRight;
  final bool noBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Transform.scale(
        scaleY: scaleY,
        scaleX: 1,
        alignment: Alignment.topCenter,
        child: Image(
          image: image,
          fit: BoxFit.fill,
        ),
      ),
      leading: noBackButton
          ? null
          : Padding(
              padding: EdgeInsets.only(bottom: paddingBottom),
              child: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
    );
  }
}
