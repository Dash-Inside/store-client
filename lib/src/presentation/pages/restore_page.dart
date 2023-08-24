import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/src/presentation/widgets/filled_button_widget.dart';
import 'package:store_client/src/presentation/widgets/text_field_widget.dart';

@Injectable()
class RestorePage extends StatelessWidget {
  static const double sizedboxHeight = 8.0;
  static const double edgeInsetsContainer = 16.0;
  static const double fontSizeHeaders = 28.0;
  static const int flex = 2;

  RestorePage();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color colorSurface = colorScheme.surface;
    final Color colorSecondary = colorScheme.secondary;
    void backOnPressed() => Navigator.of(context).pop();
    void filledButtonOnPressed() {}

    return Scaffold(
      backgroundColor: colorSurface,
      appBar: AppBar(
        backgroundColor: colorSurface,
        elevation: 0.0,
        leading: IconButton(
          onPressed: backOnPressed,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colorSecondary,
          ),
        ),
        title: Text('Restore'),
        titleTextStyle: TextStyle(
          height: 1.0,
          color: colorSecondary,
          fontSize: fontSizeHeaders,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(edgeInsetsContainer),
        child: Column(
          children: [
            Spacer(),
            Column(
              children: [
                TextFieldWidget(
                  controller: TextEditingController(),
                  hintText: 'Restore code',
                ),
                SizedBox(height: sizedboxHeight),
                TextFieldWidget(
                  controller: TextEditingController(),
                  hintText: 'New password',
                ),
                SizedBox(height: sizedboxHeight),
                TextFieldWidget(
                  controller: TextEditingController(),
                  hintText: 'New password',
                ),
              ],
            ),
            Spacer(flex: flex),
            FilledButtonWidget(
              hintText: 'Restore',
              onPressed: filledButtonOnPressed,
            ),
          ],
        ),
      ),
    );
  }
}
