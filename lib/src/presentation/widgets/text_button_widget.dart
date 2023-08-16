import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  static const double fontSize = 16.0;
  final String hintText;
  const TextButtonWidget({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: TextButton(
        onPressed: () {},
        child: Text(
          hintText,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
