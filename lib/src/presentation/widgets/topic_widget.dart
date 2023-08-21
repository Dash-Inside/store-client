import 'package:flutter/material.dart';

class TopicWidget extends StatelessWidget {
  static const double fontSizeSec = 16.0;
  final String text;

  const TopicWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color colorSec = colorScheme.secondary;
    void topicOnPressed() => Navigator.of(context).pushNamed('/markdown');

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
