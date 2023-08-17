import 'package:flutter/material.dart';

class MarkdownPage extends StatelessWidget {
  static const double fontSizeLight = 20.0;
  static const double marginContainer = 16.0;
  static const double fontSize = 28.0;
  leadingOnTap() {}
  actionOnTapBookMark() {}

  const MarkdownPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color colorSecondary = colorScheme.secondary;
    final Color colorSurface = colorScheme.surface;

    return Scaffold(
      backgroundColor: colorSurface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorSurface,
        leading: IconButton(
          onPressed: leadingOnTap,
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: colorSecondary,
          ),
        ),
        title: const Text('Topic'),
        titleTextStyle: TextStyle(
          height: 1.0,
          color: colorSecondary,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            onPressed: actionOnTapBookMark,
            icon: Icon(
              Icons.bookmark_border_outlined,
              color: colorSecondary,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(marginContainer),
        child: Text(
          'Markdown article',
          style: TextStyle(
            fontSize: fontSizeLight,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
