import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/datasources/messenger_server_datasource.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';
import 'package:store_client/src/failures/trace_failures.dart';

@Injectable(as: MessengerRepository)
class MessengerServerRepository implements MessengerRepository {
  final MessengerServerDatasource messengerServerDatasource;

  MessengerServerRepository({
    required this.messengerServerDatasource,
  });

  @override
  Future<Either<Failure, List<Message>>> fetchMessages() async {
    try {
      final Either<Failure, List<Message>> result = await messengerServerDatasource.getAllMessages();

      return result.fold(
        (failure) {
          return Left(failure);
        },
        (list) {
          return Right(list);
        },
      );
    } catch (e, stacktrace) {
      return Left(ServerFailure(stacktrace));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendMessage({required Message message}) async {
    try {
      final Either<Failure, Unit> result = await messengerServerDatasource.sendMessage(message: message);

      return result.fold(
        (failure) {
          return Left(failure);
        },
        (unit) {
          return Right(unit);
        },
      );
    } catch (e, stacktrace) {
      return Left(ServerFailure(stacktrace));
    }
  }
}
