import 'package:flutter/material.dart';

class IncommingMessageWidget extends StatelessWidget {
  static const double fontSizeMessage = 14.0;
  static const double messageBorderRadiusBottomLeft = 2.0;
  static const double messageBorderRadiusBottomRight = 8.0;
  static const double messageBorderRadiusTopLeft = 8.0;
  static const double messageBorderRadiusTopRight = 8.0;
  static const double containerPaddingVertical = 4.0;
  static const double containerPaddingHorizontal = 8.0;
  static const double containerMarginLeft = 8.0;
  static const double containerMarginRight = 44.0;
  static const double containerMarginBottom = 8.0;
  static const double avatarRad = 14.0;
  static const double sizedBoxWidth = 8.0;
  final String text;

  const IncommingMessageWidget({
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundColor: colorPr,
            radius: avatarRad,
          ),
          SizedBox(
            width: sizedBoxWidth,
          ),
          Flexible(
            child: Wrap(
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
          ),
        ],
      ),
    );
  }
}
