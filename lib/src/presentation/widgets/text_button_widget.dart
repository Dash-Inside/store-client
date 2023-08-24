import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  static const double fontSize = 16.0;
  final String text;
  final Function() textButtonOnPressed;

  const TextButtonWidget({
    super.key,
    required this.text,
    required this.textButtonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: textButtonOnPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
