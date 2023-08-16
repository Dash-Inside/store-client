import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String text;
  TextFieldWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double contentPadding = 8.0;
    double cirRad = 8.0;
    Color colorPr = Theme.of(context).colorScheme.primary;
    OutlineInputBorder outlineBord = OutlineInputBorder(
      borderRadius: BorderRadius.circular(cirRad),
      borderSide: BorderSide(
        color: colorPr,
        width: 1.0,
      ),
    );
    OutlineInputBorder outlineBord1 = OutlineInputBorder(
      borderRadius: BorderRadius.circular(cirRad),
      borderSide: BorderSide(
        color: colorPr,
        width: 1.0,
      ),
    );

    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(contentPadding),
        isDense: true,
        focusedBorder: outlineBord,
        enabledBorder: outlineBord1,
        hintText: text,
      ),
    );
  }
}
