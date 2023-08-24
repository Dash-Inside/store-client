//ignore_for_file: prefer-static-class

import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'services.config.dart';

final GetIt services = GetIt.I;

@InjectableInit(initializerName: 'generate')
FutureOr<void> initServices() => services.generate();
