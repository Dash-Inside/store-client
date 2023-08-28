import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/data_errors/data_errors.dart';
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
      final List<Message> result = await messengerServerDatasource.getAllMessages();

      return Right(result);
    } on BadRequestError {
      return Left(
        BadRequestFailure(StackTrace.empty),
      );
    } on UnauthorizedError {
      return Left(
        UnauthorizedFailure(StackTrace.empty),
      );
    } on (
      ForbiddenError,
      NotFoundError,
      InternalServerError,
      UndefiendError,
    ) {
      return Left(
        ExtraFailure(StackTrace.empty),
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, Unit>> sendMessage({required Message message}) async {
    try {
      final Unit result = await messengerServerDatasource.sendMessage(message: message);

      return Right(result);
    } on BadRequestError {
      return Left(BadRequestFailure(StackTrace.empty));
    } on UnauthorizedError {
      return Left(UnauthorizedFailure(StackTrace.empty));
    } on (ForbiddenError, NotFoundError, InternalServerError, UndefiendError) {
      return Left(ExtraFailure(StackTrace.empty));
    } catch (_) {
      rethrow;
    }
  }
}
