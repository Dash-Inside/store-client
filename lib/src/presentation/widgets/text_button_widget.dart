import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  static const double fontsize = 16.0;
  final String text;
  const TextButtonWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontsize,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
