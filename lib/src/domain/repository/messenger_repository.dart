import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/message.dart';

abstract class MessengerRepository {
  /// [sendMessage] return Either [Failure] is there is some errors or [Unit] is all is ok.
  /// [sendMessage] takes [Message] which will be sent to the server.
  Future<Either<Failure, Unit>> sendMessage({
    required Message message,
  });

  /// [fetchMessages] return  Either [Failure] is there is some errors or [List<Message>] is all is ok.
  Future<Either<Failure, List<Message>>> fetchMessages();
}
