import 'package:flutter/material.dart';

class FilledButtonWidget extends StatelessWidget {
  static const double circleBorder = 8.0;
  static const double fontSize = 20.0;
  final String hintText;
  final Function() filledButtonOnPressed;

  const FilledButtonWidget({
    super.key,
    required this.hintText,
    required this.filledButtonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(circleBorder),
              ),
            ),
          ),
        ),
        onPressed: filledButtonOnPressed,
        child: Text(
          hintText,
          style: TextStyle(
            height: 1.0,
            fontSize: fontSize,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
