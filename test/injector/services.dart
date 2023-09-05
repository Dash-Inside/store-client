import 'dart:async';

import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/data/models/user_model.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';
import 'package:store_client/src/domain/repository/user_repository.dart';
import 'package:store_client/src/domain/usecases/messenger/fetch_messages_usecase.dart';
import 'package:store_client/src/domain/usecases/messenger/send_message_usecase.dart';
import 'package:store_client/src/domain/usecases/user_data/change_avatar_url_usecase.dart';
import 'package:store_client/src/domain/usecases/user_data/change_username_usecase.dart';
import 'package:store_client/src/domain/usecases/user_data/log_in_usecase.dart';
import 'package:store_client/src/domain/usecases/user_data/restore_password_usecase.dart';

import '../domain/usecase/mock/test_repositories.mocks.dart';
import 'arrange/mock_messenger_repo.dart';
import 'arrange/mock_user_data_repo.dart';

FutureOr<void> initMockServicesTest() {
  services.registerLazySingleton<MessengerRepository>(() => arrangeMockMessengerRepository());

  services.registerLazySingleton<LibraryRepository>(() => MockLibraryRepository());

  services.registerLazySingleton<UserRepository>(() => arangeMockUserRepository());
}

FutureOr<void> initUseCaseServicesTest() {
  services.registerLazySingleton<FetchMessagesUseCase>(() => FetchMessagesUseCase());

  services.registerLazySingleton<SendMessageUsecase>(() => SendMessageUsecase());

  services.registerLazySingleton<ChangeAvatarUrlUseCase>(() => ChangeAvatarUrlUseCase());

  services.registerLazySingleton<ChangeUserNameUseCase>(() => ChangeUserNameUseCase());

  services.registerLazySingleton<LogInUseCase>(() => LogInUseCase());

  // services.registerLazySingleton<RecheckTokenUseCase>(() => RecheckTokenUseCase());

  services.registerLazySingleton<RestorePasswordUseCase>(() => RestorePasswordUseCase());
}
