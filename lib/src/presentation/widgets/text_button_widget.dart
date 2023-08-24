import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  static const double fontSize = 16.0;
  final String text;
  const TextButtonWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
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
