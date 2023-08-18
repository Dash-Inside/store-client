import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:store_client/src/data/repositories/remote/messenger_server_repository.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/data/repositories/remote/library_server_repository.dart';

final GetIt services = GetIt.I;

FutureOr<void> initServices() {
  final MessengerRepository messengerServerRepository =
      MessengerServerRepository();
  services.registerLazySingleton<MessengerRepository>(
      () => messengerServerRepository);

  final UserDataRepository userDataServerRepository =
      UserDataServerRepository();
  services.registerLazySingleton<UserDataRepository>(
      () => userDataServerRepository);

  final LibraryRepository libraryServerRepository = LibraryServerRepository();
  services
      .registerLazySingleton<LibraryRepository>(() => libraryServerRepository);
}
