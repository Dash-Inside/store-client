import 'package:flutter/material.dart';
import 'package:store_client/src/presentation/pages/account_page.dart';
import 'package:store_client/src/presentation/pages/chat_page.dart';
import 'package:store_client/src/presentation/pages/library_page.dart';
import 'package:store_client/src/presentation/pages/log_in_page.dart';
import 'package:store_client/src/presentation/pages/markdown_page.dart';
import 'package:store_client/src/presentation/pages/restore_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFFF612F),
          surface: Colors.white,
          secondary: Colors.black,
          tertiary: Color(0x00000000),
        ),
      ),
      home: LoginPage(),
      routes: {
        '/login': (_) => LoginPage(),
        '/restore': (_) => RestorePage(),
        '/library': (_) => LibraryPage(),
        '/chat': (_) => ChatPage(),
        '/account': (_) => AccountPage(),
        '/markdown': (_) => MarkdownPage(),
      },
    );
  }
}
