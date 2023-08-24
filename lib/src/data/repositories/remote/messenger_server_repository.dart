import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/data/datasources/messenger_server_datasource.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';
import 'package:store_client/src/failures/trace_failures.dart';

@Injectable(as: MessengerRepository)
class MessengerServerRepository implements MessengerRepository {
  late final MessengerServerDatasource _messengerServerDatasource;

  MessengerServerRepository() {
    _messengerServerDatasource = services.get<MessengerServerDatasource>();
  }

  @override
  Future<Either<Failure, List<Message>>> fetchMessages() async {
    try {
      final Either<Failure, List<Message>> result = await _messengerServerDatasource.getAllMessages();

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
      final Either<Failure, Unit> result = await _messengerServerDatasource.sendMessage(message: message);

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
