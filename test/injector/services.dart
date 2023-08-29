import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';
import 'package:store_client/src/domain/repository/user_repository.dart';

import '../domain/usecase/test_repositories.mocks.dart';
import 'arrange/mock_messenger_repo.dart';

FutureOr<void> initMockServices() {
  services.registerLazySingleton<MessengerRepository>(() => arrangeMockMessengerRepository());

  services.registerLazySingleton<LibraryRepository>(() => MockLibraryRepository());

  services.registerLazySingleton<UserRepository>(() => MockUserRepository());
}
