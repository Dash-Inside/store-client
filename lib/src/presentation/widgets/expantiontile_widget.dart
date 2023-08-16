import 'package:flutter/material.dart';

class ExpantionTileWidget extends StatelessWidget {
  static const double fontSizeMain = 24.0;
  static const double fontSizeSec = 16.0;
  static const double fontLetterSpacing = 0.5;
  static const double listViewEdgeInsets = 8.0;
  static const double edgeInsetsOnlyTop = 8.0;
  static const double edgeInsetsOnlyLeft = 0.0;
  static const double edgeInsetsOnlyBottom = 4.0;
  static const double marginEdgeInsetsOnlyTop = 8.0;
  static const double marginEdgeInsetsOnlyLeft = 8.0;
  static const double marginEdgeInsetsOnlyRight = 8.0;
  static const double borderRadCir = 8.0;
  static const double edgeInsetsSym = 16.0;
  final String title;

  const ExpantionTileWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color colorSec = colorScheme.secondary;
    final Color colorPr = colorScheme.primary;

    return Container(
      margin: EdgeInsets.only(
        left: marginEdgeInsetsOnlyLeft,
        right: marginEdgeInsetsOnlyRight,
        top: marginEdgeInsetsOnlyTop,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: colorPr),
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadCir),
        ),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(
          horizontal: edgeInsetsSym,
        ),
        childrenPadding: EdgeInsets.only(
          left: edgeInsetsOnlyLeft,
          top: edgeInsetsOnlyTop,
          bottom: edgeInsetsOnlyBottom,
        ),
        title: Text(
          title,
          style: TextStyle(
            height: 1.0,
            fontSize: fontSizeMain,
            fontWeight: FontWeight.w400,
            letterSpacing: fontLetterSpacing,
            color: colorSec,
          ),
        ),
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Topic #1',
                  style: TextStyle(
                    color: colorSec,
                    fontSize: fontSizeSec,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
