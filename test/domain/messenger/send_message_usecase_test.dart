import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/src/data/repositories/remote/messenger_server_repository.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/usecases/messenger/send_message_usecase.dart';

@GenerateNiceMocks([MockSpec<MessengerServerRepository>()])
import 'send_message_usecase_test.mocks.dart';

void main() {
  final Message message = Message(id: 2, data: "data", senderId: 4);
  test(
    "sender_message_usecase_test",
    () async {
      // Act.
      final MessengerServerRepository messengerServerRepository = MockMessengerServerRepository();
      when(messengerServerRepository.sendMessage(message: message)).thenAnswer(
        (realInvocation) async {
          return Right(unit);
        },
      );

      // Arrange.
      final SendMessageUsecase sendMessageUsecase = SendMessageUsecase();
      final result = await sendMessageUsecase.call(message);

      // Assert.
      verify(messengerServerRepository.sendMessage(message: message)).called(1);
      verifyNoMoreInteractions(messengerServerRepository);
      expect(result, Right(unit));
    },
  );
}
