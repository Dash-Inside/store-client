import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/datasources/messenger_server_datasource.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/core/services/services.dart';

import '../../injector/services.dart';

void main() async {
  final Message message = Message(
    id: 1,
    data: "data",
    senderId: 1,
  );
  await initTestServices();

  group('messenger_server_datasource_test', () {
    test('method_getAllMessages_test', () async {
      final MessengerServerDatasource messengerServerDatasource =
          services.get<MessengerServerDatasource>();

      final Either<Failure, List<Message>> result =
          await messengerServerDatasource.getAllMessages();

      expect(result.isRight(), true);
    });

    test('method_sendMessage_test', () async {
      final MessengerServerDatasource messengerServerDatasource =
          services.get<MessengerServerDatasource>();

      final Either<Failure, Unit> result =
          await messengerServerDatasource.sendMessage(message: message);

      expect(result.isRight(), true);
    });
  });
}
