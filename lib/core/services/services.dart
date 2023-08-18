import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:store_client/src/data/repositories/remote/messenger_server_repository.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/data/repositories/remote/library_server_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt services = GetIt.I;

FutureOr<void> initServices() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  services.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  final MessengerServerRepository messengerServerRepository = MessengerServerRepository();
  services.registerLazySingleton<MessengerServerRepository>(() => messengerServerRepository);

  final UserDataServerRepository userDataServerRepository = UserDataServerRepository();
  services.registerLazySingleton<UserDataServerRepository>(() => userDataServerRepository);

  final LibraryServerRepository libraryServerRepository = LibraryServerRepository();
  services.registerLazySingleton<LibraryServerRepository>(() => libraryServerRepository);
}
