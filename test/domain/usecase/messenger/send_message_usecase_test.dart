import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';
import 'package:store_client/src/domain/usecases/messenger/send_message_usecase.dart';

void main() {
  final Message correctMessage = Message(id: 1, data: "data", senderId: 3);
  final Message incorrectMessage = Message(id: -1, data: "data", senderId: 3);
  group('send message usecase test', () {
    test('correct send message test', () async {
      //Act.
      final MessengerRepository messengerRepository = services<MessengerRepository>();
      final SendMessageUsecase sendMessageUsecase = services<SendMessageUsecase>();

      //Arrange.
      final Either<Failure, Unit> failOrMessage = await sendMessageUsecase.call(correctMessage);

      //Accert.
      expect(failOrMessage.isRight(), true);
      verify(messengerRepository.sendMessage(message: correctMessage)).called(1);
      verifyNoMoreInteractions(messengerRepository);
    });

    test('incorrect send message test', () async {
      //Act.
      final MessengerRepository messengerRepository = services<MessengerRepository>();
      final SendMessageUsecase sendMessageUsecase = services<SendMessageUsecase>();

      //Arrange.
      final Either<Failure, Unit> failOrMessage = await sendMessageUsecase.call(incorrectMessage);

      //Accert.
      expect(failOrMessage.isLeft(), true);
      verifyNoMoreInteractions(messengerRepository);
    });
  });
}
