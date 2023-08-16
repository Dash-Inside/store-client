import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/data/repositories/remote/messenger_server_repository.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';

class FetchMessagesUseCase extends UseCase<List<Message>, Unit> {
  final MessengerRepository messengerRepository = services.get<MessengerServerRepository>();

  @override
  FutureOr<Either<Failure, List<Message>>> call(Unit params) {
    return messengerRepository.fetchMessages();
  }
}
