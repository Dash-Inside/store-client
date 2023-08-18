//ignore_for_file: prefer-static-class, avoid-top-level-members-in-tests, no-empty-block

import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';

import '../domain/test_repositories.mocks.dart';

final GetIt testServices = GetIt.I;

FutureOr<void> initTestServices() {
  final LibraryRepository libraryRepository = MockLibraryRepository();
  testServices
      .registerLazySingleton<LibraryRepository>(() => libraryRepository);
}
