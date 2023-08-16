import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double iconSize = 24.0;
    double fontSize = 10.0;
    double paddingSymmetric = 10.0;
    double fontLetterSpacing = 0.5;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Color colorSec = colorScheme.secondary;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: paddingSymmetric,
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              child: Column(
                children: [
                  Icon(
                    Icons.chat_rounded,
                    size: iconSize,
                    color: colorSec,
                  ),
                  Text(
                    'chat',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w400,
                      letterSpacing: fontLetterSpacing,
                      color: colorSec,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              child: Column(
                children: [
                  Icon(
                    Icons.menu_book_rounded,
                    size: iconSize,
                    color: colorSec,
                  ),
                  Text(
                    'library',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w400,
                      letterSpacing: fontLetterSpacing,
                      color: colorSec,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              child: Column(
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    size: iconSize,
                    color: colorSec,
                  ),
                  Text(
                    'account',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w400,
                      letterSpacing: fontLetterSpacing,
                      color: colorSec,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
