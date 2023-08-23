import 'dart:async';

import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/data/datasources/messenger_server_datasource.dart';
import 'package:store_client/src/data/datasources/user_data_server_datasource.dart';
import 'package:store_client/src/data/repositories/remote/library_server_repository.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';

import '../domain/test_repositories.mocks.dart';

FutureOr<void> initTestServices() {
  services.registerLazySingleton<UserDataServerRepository>(() => UserDataServerRepository());

  services.registerLazySingleton<LibraryServerRepository>(() => LibraryServerRepository());

  services.registerLazySingleton<MessengerServerDatasource>(() => MessengerServerDatasource());

  services.registerLazySingleton<UserDataServerDatasource>(() => UserDataServerDatasource());
}

FutureOr<void> initMockServices() {
  services.registerLazySingleton<LibraryRepository>(() => MockLibraryRepository());

  services.registerLazySingleton<UserDataRepository>(() => MockUserDataRepository());

  services.registerLazySingleton<MessengerRepository>(() => MockMessengerRepository());
}
