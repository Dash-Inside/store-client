import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:store_client/src/domain/repository/user_data_repository.dart';

import '../domain/test_repositories.mocks.dart';

final GetIt testServices = GetIt.I;

FutureOr<void> initTestServices() {
  final UserDataRepository userDataRepository = MockUserDataRepository();

  testServices.registerLazySingleton<UserDataRepository>(() => userDataRepository);
}
