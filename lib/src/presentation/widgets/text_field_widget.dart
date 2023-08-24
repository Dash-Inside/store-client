import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  static const double fontSizeThin = 16.0;
  static const double contentPadding = 8.0;
  static const double borderRadius = 8.0;

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Color borderColor = Theme.of(context).colorScheme.primary;

    OutlineInputBorder outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
      borderSide: BorderSide(
        color: borderColor,
        width: 1.0,
      ),
    );
    OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      ),
      borderSide: BorderSide(
        color: borderColor,
        width: 1.0,
      ),
    );

    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: textTheme.labelSmall?.copyWith(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(contentPadding),
        focusedBorder: outlineBorder,
        enabledBorder: enabledBorder,
        hintText: hintText,
        hintStyle: textTheme.labelSmall?.copyWith(
          color: Colors.grey,
        ),
      ),
    );
  }
}
