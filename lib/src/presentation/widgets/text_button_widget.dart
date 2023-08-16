import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  const TextButtonWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double fontsize = 16.0;

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
