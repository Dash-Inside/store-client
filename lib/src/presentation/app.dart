import 'package:flutter/material.dart';
import 'package:store_client/src/presentation/pages/log_in_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFFF612F),
          surface: Colors.white,
          secondary: Colors.black,
          tertiary: Color(0x00000000),
        ),
      ),
    );
  }
}
