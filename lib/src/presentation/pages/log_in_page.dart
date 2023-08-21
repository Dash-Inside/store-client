import 'package:flutter/material.dart';
import 'package:store_client/src/presentation/widgets/filled_button_widget.dart';
import 'package:store_client/src/presentation/widgets/text_button_widget.dart';
import 'package:store_client/src/presentation/widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  static const int flex = 3;
  static const double sizedBoxHeight = 8.0;
  static const double letterSpacing = 0.5;
  static const double edgeInsetsAll = 16.0;
  static const double fontSizeThin = 16.0;
  static const double fontSizeHeaders = 28.0;

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color colorSurf = colorScheme.surface;
    void textButtonOnPressed() => Navigator.of(context).pushNamed('/restore');
    void filledButtonOnPressed() => Navigator.of(context).pushNamed('/library');

    return Scaffold(
      backgroundColor: colorSurf,
      body: Container(
        margin: EdgeInsets.all(edgeInsetsAll),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Dash Inside',
              style: TextStyle(
                fontSize: fontSizeHeaders,
                fontWeight: FontWeight.w500,
                letterSpacing: letterSpacing,
              ),
            ),
            Text(
              'Non-Profit Organization',
              style: TextStyle(
                fontSize: fontSizeThin,
                fontWeight: FontWeight.w300,
              ),
            ),
            Spacer(
              flex: flex,
            ),
            TextFieldWidget(text: 'Email'),
            SizedBox(height: sizedBoxHeight),
            TextFieldWidget(text: 'Password'),
            Spacer(),
            TextButtonWidget(
              text: 'Restore Account',
              textButtonOnPressed: textButtonOnPressed,
            ),
            SizedBox(
              height: sizedBoxHeight,
            ),
            FilledButtonWidget(
              hintText: 'Log in',
              filledButtonOnPressed: filledButtonOnPressed,
            ),
          ],
        ),
      ),
    );
  }
}
