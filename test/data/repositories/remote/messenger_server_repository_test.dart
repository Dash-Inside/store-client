import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/repositories/remote/messenger_server_repository.dart';
import 'package:store_client/src/domain/entities/message.dart';

import '../../../injector/services.dart';

Future<void> main() async {
  await initTestServices();

  final int trueId = 1;
  final String trueData = 'test';
  final int trueSenderId = 1;

  final int falseSenderId = -1;
  final String falseData = '';

  final Message trueMessage = Message(
    id: trueId,
    data: trueData,
    senderId: trueSenderId,
  );

  final Message falseMessage = Message(
    id: trueId,
    data: falseData,
    senderId: falseSenderId,
  );

  group(
    'messenger_server_repository_test',
    () {
      test('fetchMessages', () async {
        final MessengerServerRepository messengerServerRepository = testServices.get<MessengerServerRepository>();

        final Either<Failure, List<Message>> result = await messengerServerRepository.fetchMessages();

        expect(result.isRight(), true);
      });

      test('sendMessage_correct_request', () async {
        final MessengerServerRepository messengerServerRepository = testServices.get<MessengerServerRepository>();

        final Either<Failure, Unit> result = await messengerServerRepository.sendMessage(message: trueMessage);

        expect(result.isRight(), true);
      });

      test('sendMessage_uncorrect_request', () async {
        final MessengerServerRepository messengerServerRepository = testServices.get<MessengerServerRepository>();

        final Either<Failure, Unit> result = await messengerServerRepository.sendMessage(message: falseMessage);

        expect(result.isLeft(), true);
      });
    },
  );
}
