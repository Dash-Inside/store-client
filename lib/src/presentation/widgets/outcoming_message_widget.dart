import 'package:flutter/material.dart';

class OutcomingMessageWidget extends StatelessWidget {
  static const double containerMarginLeft = 44.0;
  static const double containerMarginRight = 8.0;
  static const double containerMarginBottom = 8.0;
  static const double containerPaddingVertical = 4.0;
  static const double containerPaddingHorizontal = 8.0;
  static const double messageBorderRadiusBottomLeft = 8.0;
  static const double messageBorderRadiusBottomRight = 2.0;
  static const double messageBorderRadiusTopLeft = 8.0;
  static const double messageBorderRadiusTopRight = 8.0;
  static const double fontSizeMessage = 14.0;
  final String text;

  const OutcomingMessageWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color colorSurf = colorScheme.surface;
    final Color colorPr = colorScheme.primary;

    return Container(
      margin: EdgeInsets.only(
        bottom: containerMarginBottom,
        left: containerMarginLeft,
        right: containerMarginRight,
      ),
      child: Wrap(
        alignment: WrapAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: containerPaddingHorizontal,
              vertical: containerPaddingVertical,
            ),
            decoration: BoxDecoration(
              color: colorPr,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  messageBorderRadiusBottomLeft,
                ),
                bottomRight: Radius.circular(
                  messageBorderRadiusBottomRight,
                ),
                topLeft: Radius.circular(
                  messageBorderRadiusTopLeft,
                ),
                topRight: Radius.circular(
                  messageBorderRadiusTopRight,
                ),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSizeMessage,
                fontWeight: FontWeight.w400,
                color: colorSurf,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
