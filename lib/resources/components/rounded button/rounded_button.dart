import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Color? colors;
  final VoidCallback onPressed;
  final Color? textColor;
  final double? height;
  final double? width;

  const RoundedButton(
      {super.key,
      required this.title,
      this.colors,
      required this.onPressed,
      this.height = 50,
      this.width = 200,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 20, color: textColor),
        )),
      ),
    );
  }
}
