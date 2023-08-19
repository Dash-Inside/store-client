import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:store_client/src/data/repositories/remote/user_data_server_repository.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';

import '../domain/test_repositories.mocks.dart';

final GetIt testServices = GetIt.I;

FutureOr<void> initTestServices() {
  final UserDataServerRepository userDataServerRepository = UserDataServerRepository();
  testServices.registerLazySingleton<UserDataServerRepository>(() => userDataServerRepository);

  final UserDataRepository userDataRepository = MockUserDataRepository();
  testServices.registerLazySingleton<UserDataRepository>(() => userDataRepository);

  final LibraryRepository libraryRepository = MockLibraryRepository();
  testServices.registerLazySingleton<LibraryRepository>(() => libraryRepository);

  final MessengerRepository messengerRepository = MockMessengerRepository();
  testServices.registerLazySingleton<MessengerRepository>(() => messengerRepository);
}
