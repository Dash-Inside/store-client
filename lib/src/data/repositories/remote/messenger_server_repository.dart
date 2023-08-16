import 'package:dartz/dartz.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';

class MessengerServerRepository implements MessengerRepository {
  @override
  Future<Either<Failure, List<Message>>> fetchMessages() {
    // TODO: implement fetchMessages
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> sendMessage({required Message message}) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}
