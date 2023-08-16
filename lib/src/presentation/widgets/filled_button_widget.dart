import 'package:flutter/material.dart';

class FilledButtonWidget extends StatelessWidget {
  final String text;
  const FilledButtonWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double fontsize = 20.0;
    double circleborder = 8.0;

    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(circleborder),
              ),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            height: 1.0,
            fontSize: fontsize,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
