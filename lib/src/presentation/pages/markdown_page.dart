import 'package:flutter/material.dart';

class MarkdownPage extends StatelessWidget {
  static const double fontSize2 = 20.0;
  static const double margin = 16.0;
  static const double fontSize = 28.0;
  static const int shadowColor = 0x00000000;
  const MarkdownPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color colorSecondary = colorScheme.secondary;
    final Color colorSurface = colorScheme.surface;

    return Scaffold(
      backgroundColor: colorSurface,
      appBar: AppBar(
        shadowColor: Color(shadowColor),
        backgroundColor: colorSurface,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
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
            onPressed: () {},
            icon: Icon(
              Icons.bookmark_border_outlined,
              color: colorSecondary,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(margin),
        child: Text(
          'Markdown article',
          style: TextStyle(
            fontSize: fontSize2,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
