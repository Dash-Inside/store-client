import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:store_client/src/presentation/pages/library_page.dart';
import 'package:store_client/src/presentation/pages/log_in_page.dart';

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
      home: BlocBuilder<AuthBloc, AuthState>(
        bloc: services<AuthBloc>(),
        builder: (_, state) {
          switch (state) {
            case NullAuthState():
              return LoginPage();
            case DataAuthState():
              return LibraryPage();
          }
        },
      ),
    );
  }
}
