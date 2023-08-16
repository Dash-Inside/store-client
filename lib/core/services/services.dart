import 'dart:async';

import 'package:get_it/get_it.dart';

final GetIt services = GetIt.I;

FutureOr<void> initServices() {
  late final MessengerServerRepository messengerServerRepository = MessengerServerRepository();
  services.registerLazySingleton<MessengerServerRepository>(() => messengerRepository)
}
