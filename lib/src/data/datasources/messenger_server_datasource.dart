import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/failure/failure.dart';
import 'package:store_client/src/data/models/message_model.dart';
import 'package:store_client/src/domain/entities/message.dart';

class MessengerServerDatasource {
  final Dio _client = Dio();
  static const String _baseUri = 'http://127.0.0.1:1337/api/message';

  Future<Either<Failure, List<Message>>> getAllMessages() async {
    try {
      final Response response = await _client.get(_baseUri);
      final List<dynamic> listMap = response.data['data'];
      List<Message> listMessage = [];

      listMap.forEach(
        (messageMap) {
          listMessage.add(MessageModel.fromMap(messageMap));
        },
      );

      return Right(listMessage);
    } catch (e, stacktrace) {
      return Left(
        UnhandledFailure(
          message: e.toString(),
          stackTrace: stacktrace,
        ),
      );
    }
  }

  Future<Either<Failure, Unit>> sendMessage({required Message message}) async {
    try {
      if (message.senderId <= 0 || message.data == '') {
        return Left(ParamsFailure(StackTrace.current));
      }

      MessageModel messageModel = MessageModel(
        id: message.id,
        data: message.data,
        senderId: message.senderId,
      );

      final Response response = await _client.post(
        _baseUri,
        data: messageModel.toMap(),
      );

      return Right(unit);
    } catch (e, stacktrace) {
      return Left(
        UnhandledFailure(
          message: e.toString(),
          stackTrace: stacktrace,
        ),
      );
    }
  }
}
