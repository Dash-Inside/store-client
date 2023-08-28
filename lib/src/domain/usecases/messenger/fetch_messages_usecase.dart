import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';

@Injectable()
class FetchMessagesUseCase extends UseCase<List<Message>, Unit> {
  @override
  FutureOr<Either<Failure, List<Message>>> call(Unit p) {
    final MessengerRepository messengerRepository = services.get<MessengerRepository>();

    return messengerRepository.fetchMessages();
  }
}
