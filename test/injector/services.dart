import 'dart:async';

import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';

FutureOr<void> initTestServices() {
  final MessengerRepository messengerRepository = MockMessageRepository();
  services.registerSingleton<MessengerRepository>(() => messengerRepository);
}
