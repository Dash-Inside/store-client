import 'package:flutter/material.dart';

import '../widgets/filled_button_widget.dart';
import '../widgets/text_button_widget.dart';
import '../widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  static const flex = 3;
  static const double sizedboxheight = 8.0;
  static const double letterspacing = 0.5;

  static const double edgeinsetsall = 16.0;
  static const double fontsize2 = 16.0;
  static const double fontsize1 = 28.0;
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    Color colorSurf = colorScheme.surface;

    return Scaffold(
      backgroundColor: colorSurf,
      body: Container(
        margin: EdgeInsets.all(edgeinsetsall),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Dash-Inside',
              style: TextStyle(
                fontSize: fontsize1,
                fontWeight: FontWeight.w500,
                letterSpacing: letterspacing,
              ),
            ),
            Text(
              'Non-Profit Organization',
              style: TextStyle(
                fontSize: fontsize2,
                fontWeight: FontWeight.w300,
              ),
            ),
            Spacer(
              flex: flex,
            ),
            TextFieldWidget(text: 'Email'),
            SizedBox(height: sizedboxheight),
            TextFieldWidget(text: 'Password'),
            Spacer(),
            TextButtonWidget(text: 'Restore code'),
            SizedBox(
              height: sizedboxheight,
            ),
            FilledButtonWidget(hintText: 'Log in'),
          ],
        ),
      ),
    );
  }
}
