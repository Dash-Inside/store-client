import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/data/models/message_model.dart';
import 'package:store_client/src/data/utils/status_code_handler.dart';
import 'package:store_client/src/domain/entities/message.dart';

@Injectable()
class MessengerServerDatasource {
  final DioModule dioModule;
  static const String _baseUri = 'http://127.0.0.1:1337/api/message';

  MessengerServerDatasource({required this.dioModule});

  Future<List<Message>> getAllMessages() async {
    try {
      final Response response = await dioModule.client.get(_baseUri);
      StatusCodeHandler.check(response.statusCode.toString());

      final List listMap = response.data['data'];
      List<Message> listMessage = [];

      listMap.forEach(
        (messageMap) {
          listMessage.add(MessageModel.fromMap(messageMap));
        },
      );

      return listMessage;
    } catch (_) {
      rethrow;
    }
  }

  Future<Unit> sendMessage({required Message message}) async {
    try {
      MessageModel messageModel = MessageModel(
        id: message.id,
        data: message.data,
        senderId: message.senderId,
      );

      final Response response = await dioModule.client.post(
        _baseUri,
        data: messageModel.toMap(),
      );

      return StatusCodeHandler.check(response.statusCode.toString());
    } catch (_) {
      rethrow;
    }
  }
}
