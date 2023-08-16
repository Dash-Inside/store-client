import 'dart:async';

import 'package:get_it/get_it.dart';

final GetIt services = GetIt.I;

FutureOr<void> initServices() {
  final MessengerServerRepository messengerServerRepository = MessengerServerRepository();
  services.registerLazySingleton<MessengerServerRepository>(() => messengerRepository)

  final UserDataServerRepository userDataServerRepository = UserDataServerRepository();
  services.registerLazySingleton<UserDataServerRepository>(() => userDataServerRepository);
}
