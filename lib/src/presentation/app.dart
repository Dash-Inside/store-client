import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:store_client/src/presentation/bloc/log_in/log_in_bloc.dart';
import 'package:store_client/src/presentation/pages/library_page.dart';
import 'package:store_client/src/presentation/pages/log_in_page.dart';

@Injectable()
class App extends StatelessWidget {
  final AuthBloc authBloc;

  const App({
    required this.authBloc,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          displaySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 28.0,
            letterSpacing: 0.5,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 24.0,
            letterSpacing: 0.5,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20.0,
            letterSpacing: 0.0,
          ),
          labelSmall: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 16.0,
            letterSpacing: 0.0,
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFFF612F),
          surface: Colors.white,
          secondary: Colors.black,
          tertiary: Color(0x00000000),
        ),
      ),
      home: BlocBuilder<AuthBloc, AuthState>(
        bloc: authBloc,
        builder: (_, state) {
          switch (state) {
            case NullAuthState():
              return services<LoginPage>();
            case DataAuthState():
              return services<LibraryPage>();
          }
        },
      ),
    );
  }
}
