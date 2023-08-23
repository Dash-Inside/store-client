import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/datasources/messenger_server_datasource.dart';
import 'package:store_client/src/data/models/message_model.dart';
import 'package:store_client/src/domain/entities/message.dart';

import '../../injector/services.dart';

void main() async {
  final Message message = Message(
    id: 1,
    data: "data",
    senderId: 1,
  );

  final Message messageFail = Message(
    id: 1,
    data: "",
    senderId: -1,
  );

  final List<MessageModel> lsMessage = [
    MessageModel(id: 13, data: 'data', senderId: 1),
    MessageModel(id: 14, data: 'data', senderId: 1),
  ];

  await initTestServices();

  group('messenger_server_datasource_test', () {
    test('method_getAllMessages_test_with_list', () async {
      final MessengerServerDatasource messengerServerDatasource = testServices.get<MessengerServerDatasource>();

      final Either<Failure, List<Message>> result = await messengerServerDatasource.getAllMessages();

      final res = result.fold(
        (l) => l,
        (r) => r,
      );

      expect(result.isRight(), true);
      expect(res, lsMessage);
    });

    test('method_getAllMessages_test_with_list_uncorrect', () async {
      final MessengerServerDatasource messengerServerDatasource = testServices.get<MessengerServerDatasource>();

      final Either<Failure, Unit> result = await messengerServerDatasource.sendMessage(message: messageFail);

      expect(result.isLeft(), true);
    });

    test('method_sendMessage_test', () async {
      final MessengerServerDatasource messengerServerDatasource = testServices.get<MessengerServerDatasource>();

      final Either<Failure, Unit> result = await messengerServerDatasource.sendMessage(message: message);

      final res = result.fold(
        (l) => l,
        (r) => r,
      );

      expect(result.isRight(), true);
      expect(res, unit);
    });
  });
}
