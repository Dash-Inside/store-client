import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:store_client/src/data/datasources/user_data_server_datasource.dart';
import 'package:store_client/src/data/repositories/remote/messenger_server_repository.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/data/repositories/remote/library_server_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';

final GetIt services = GetIt.I;

FutureOr<void> initServices() {
  final FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
  services.registerLazySingleton<FlutterSecureStorage>(() => flutterSecureStorage);

  final MessengerRepository messengerServerRepository = MessengerServerRepository();
  services.registerLazySingleton<MessengerRepository>(() => messengerServerRepository);

  final UserDataRepository userDataServerRepository = UserDataServerRepository();
  services.registerLazySingleton<UserDataRepository>(() => userDataServerRepository);

  final LibraryRepository libraryServerRepository = LibraryServerRepository();
  services.registerLazySingleton<LibraryRepository>(() => libraryServerRepository);

  final UserDataServerDatasource userDataServerDatasource = UserDataServerDatasource();
  services.registerLazySingleton<UserDataServerDatasource>(() => userDataServerDatasource);
}
