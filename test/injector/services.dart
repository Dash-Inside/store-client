import 'dart:async';

import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/data/datasources/messenger_server_datasource.dart';
import 'package:store_client/src/data/repositories/remote/library_server_repository.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';

import '../domain/test_repositories.mocks.dart';

FutureOr<void> initTestServices() {
  final UserDataServerRepository userDataServerRepository = UserDataServerRepository();
  services.registerLazySingleton<UserDataServerRepository>(() => userDataServerRepository);

  final UserDataRepository userDataRepository = MockUserDataRepository();
  services.registerLazySingleton<UserDataRepository>(() => userDataRepository);

  final LibraryRepository libraryRepository = MockLibraryRepository();
  services.registerLazySingleton<LibraryRepository>(() => libraryRepository);

  final MessengerRepository messengerRepository = MockMessengerRepository();
  services.registerLazySingleton<MessengerRepository>(() => messengerRepository);

  final LibraryServerRepository libraryServerRepository = LibraryServerRepository();
  services.registerLazySingleton<LibraryServerRepository>(() => libraryServerRepository);

  final MessengerServerDatasource messengerServerDatasource = MessengerServerDatasource();
  services.registerLazySingleton<MessengerServerDatasource>(() => messengerServerDatasource);
}
