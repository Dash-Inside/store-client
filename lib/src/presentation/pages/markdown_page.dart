import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class MarkdownPage extends StatelessWidget {
  static const double fontSizeLight = 20.0;
  static const double marginContainer = 16.0;
  static const double fontSize = 28.0;
  final String topicName = 'Topic';

  const MarkdownPage();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color colorSecondary = colorScheme.secondary;
    final Color colorSurface = colorScheme.surface;
    void backOnPressed() => Navigator.of(context).pop();
    void actionOnPressedBookMark() {}

    return Scaffold(
      backgroundColor: colorSurface,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: colorSurface,
        leading: IconButton(
          onPressed: backOnPressed,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colorSecondary,
          ),
        ),
        title: Text(topicName),
        titleTextStyle: TextStyle(
          height: 1.0,
          color: colorSecondary,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            onPressed: actionOnPressedBookMark,
            icon: Icon(
              Icons.bookmark_border_outlined,
              color: colorSecondary,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(marginContainer),
        child: Markdown(
          data: '## ***Markdown** article*',
        ),
      ),
    );
  }
}
