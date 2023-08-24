import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:store_client/src/presentation/widgets/filled_button_widget.dart';
import 'package:store_client/src/presentation/widgets/text_button_widget.dart';
import 'package:store_client/src/presentation/widgets/text_field_widget.dart';

@Injectable()
class LoginPage extends StatelessWidget {
  static const int flex = 3;
  static const double sizedBoxHeight = 8.0;
  static const double letterSpacing = 0.5;
  static const double edgeInsetsAll = 16.0;

  final AuthBloc authBloc;

  const LoginPage({
    required this.authBloc,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color colorSurf = colorScheme.surface;

    void recoveryPressed() => Navigator.of(context).pushNamed('/restore');
    void loginPressed() {
      authBloc.add(
        LoginAuthEvent(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }

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
              style: textTheme.displaySmall?.copyWith(
                color: Colors.black,
              ),
            ),
            Text(
              'Non-Profit Organization',
              style: textTheme.labelSmall?.copyWith(
                color: Colors.black,
              ),
            ),
            Spacer(
              flex: flex,
            ),
            TextFieldWidget(
              controller: emailController,
              hintText: 'Email',
            ),
            SizedBox(
              height: sizedBoxHeight,
            ),
            TextFieldWidget(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            Spacer(),
            TextButtonWidget(
              text: 'Restore Account',
              onPressed: recoveryPressed,
            ),
            SizedBox(
              height: sizedBoxHeight,
            ),
            FilledButtonWidget(
              hintText: 'Log in',
              onPressed: loginPressed,
            ),
          ],
        ),
      ),
    );
  }
}
