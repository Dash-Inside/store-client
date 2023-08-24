import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';
import 'package:store_client/src/domain/usecases/messenger/fetch_messages_usecase.dart';

import '../../injector/services.dart';

Future<void> main() async {
  await initTestServices();

  final Message message = Message(id: 2, data: "data", senderId: 4);
  final Message message3 = Message(id: 1, data: "data", senderId: 2);
  final List<Message> listmess = [message, message3];

  test(
    'fetch_messages_usecase_test',
    () async {
      // Act.
      final MessengerRepository messengerRepository = testServices.get<MessengerRepository>();
      when(messengerRepository.fetchMessages()).thenAnswer(
        (_) async {
          return Right(listmess);
        },
      );

      // Arrange.
      final FetchMessagesUseCase fetchMessagesUseCase = FetchMessagesUseCase();
      final Either<Failure, List<Message>> result = await fetchMessagesUseCase.call(unit);

      // Assert.
      verify(messengerRepository.fetchMessages()).called(1);
      verifyNoMoreInteractions(messengerRepository);
      expect(result, Right(listmess));
    },
  );
}
