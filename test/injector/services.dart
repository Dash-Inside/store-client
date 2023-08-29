import 'dart:async';

import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';
import 'package:store_client/src/domain/repository/user_repository.dart';

import '../domain/usecase/test_repositories.mocks.dart';

FutureOr<void> initTestServices() {
  final MessengerRepository messengerRepository = MockMessengerRepository();
  services.registerLazySingleton<MessengerRepository>(() => messengerRepository);

  final LibraryRepository libraryRepository = MockLibraryRepository();
  services.registerLazySingleton<LibraryRepository>(() => libraryRepository);

  final UserRepository userRepository = MockUserRepository();
  services.registerLazySingleton<UserRepository>(() => userRepository);
}
