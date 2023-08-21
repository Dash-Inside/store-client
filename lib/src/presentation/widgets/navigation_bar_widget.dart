import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  static const double iconSize = 24.0;
  static const double fontSize = 10.0;
  static const double paddingSymmetric = 10.0;
  static const double fontLetterSpacing = 0.5;

  const NavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color colorSec = colorScheme.secondary;
    final Color colorTet = colorScheme.tertiary;
    void chatOnTap() => Navigator.of(context).pushNamed('/chat');
    void libraryOnTap() => Navigator.of(context).pushNamed('/library');
    void accountOnTap() => Navigator.of(context).pushNamed('/account');

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: paddingSymmetric,
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              hoverColor: colorTet,
              onTap: chatOnTap,
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
              hoverColor: colorTet,
              onTap: libraryOnTap,
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
              hoverColor: colorTet,
              onTap: accountOnTap,
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
