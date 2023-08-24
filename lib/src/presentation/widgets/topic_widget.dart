import 'package:flutter/material.dart';

class TopicWidget extends StatelessWidget {
  static const double fontSizeSec = 16.0;
  final String text;
  final Function()? topicOnPressed;

  const TopicWidget({
    super.key,
    required this.text,
    this.topicOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color colorSec = colorScheme.secondary;

    return Row(
      children: [
        TextButton(
          onPressed: topicOnPressed,
          child: Text(
            text,
            style: TextStyle(
              color: colorSec,
              fontSize: fontSizeSec,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
