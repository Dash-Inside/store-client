import 'package:flutter/material.dart';
import 'package:store_client/src/presentation/widgets/filled_button_widget.dart';
import 'package:store_client/src/presentation/widgets/text_field_widget.dart';

class RestorePage extends StatelessWidget {
  static const double sizedboxHeight = 8.0;
  static const double edgeInsetsContainer = 16.0;
  static const double fontSizeHeaders = 28.0;
  RestorePage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Color colorSurface = colorScheme.surface;
    Color colorSecondary = colorScheme.secondary;

    return Scaffold(
      backgroundColor: colorSurface,
      body: Container(
        margin: EdgeInsets.all(edgeInsetsContainer),
        child: Column(
          children: [
            AppBar(
              backgroundColor: colorSurface,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: colorSecondary,
                ),
              ),
              title: Text('Restore'),
              titleTextStyle: TextStyle(
                color: colorSecondary,
                fontSize: fontSizeHeaders,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Column(
              children: [
                TextFieldWidget(text: 'Restore code'),
                SizedBox(height: sizedboxHeight),
                TextFieldWidget(text: 'New password'),
                SizedBox(height: sizedboxHeight),
                TextFieldWidget(text: 'New password'),
              ],
            ),
            Spacer(),
            Spacer(),
            FilledButtonWidget(hintText: 'Restore'),
          ],
        ),
      ),
    );
  }
}
