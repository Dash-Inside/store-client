//ignore_for_file: prefer-static-class, avoid-ignoring-return-values

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/src/presentation/bloc/auth/auth_bloc.dart';

import 'services.config.dart';

final GetIt services = GetIt.I;

@InjectableInit(initializerName: 'generate')
FutureOr<void> initServices() {
  services.generate();

  services<AuthBloc>().add(RecheckTokenAuthEvent());
}

@injectable
class DioModule {
  Dio get client => Dio();
}

@injectable
class SecureModule {
  FlutterSecureStorage get storage => FlutterSecureStorage();
}
