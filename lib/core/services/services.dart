import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:store_client/src/data/repositories/remote/messenger_server_repository.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/data/repositories/remote/library_server_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final GetIt services = GetIt.I;

FutureOr<void> initServices() async {
  final FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
  services.registerLazySingleton<FlutterSecureStorage>(() => flutterSecureStorage);

  final MessengerServerRepository messengerServerRepository = MessengerServerRepository();
  services.registerLazySingleton<MessengerServerRepository>(() => messengerServerRepository);

  final UserDataServerRepository userDataServerRepository = UserDataServerRepository();
  services.registerLazySingleton<UserDataServerRepository>(() => userDataServerRepository);

  final LibraryServerRepository libraryServerRepository = LibraryServerRepository();
  services.registerLazySingleton<LibraryServerRepository>(() => libraryServerRepository);
}
