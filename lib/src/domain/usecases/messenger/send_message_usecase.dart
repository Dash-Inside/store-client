import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/core/usecases/usecases.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/failure/message_failure.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';
import 'package:store_client/src/domain/validators/send_messedge_validator.dart';

@Injectable()
class SendMessageUsecase extends UseCase<Unit, Message> {
  final MessengerRepository messengerRepository = services<MessengerRepository>();
  @override
  FutureOr<Either<Failure, Unit>> call(Message message) async {
    if (!(await SendMessedgeValidator().validate(message))) {
      return Left(NotValidMessageFailure());
    }

    return messengerRepository.sendMessage(message: message);
  }
}
