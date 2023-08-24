import 'package:flutter/material.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(services<App>());
}
