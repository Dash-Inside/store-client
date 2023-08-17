import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/src/data/repositories/remote/messenger_server_repository.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/usecases/messenger/fetch_messages_usecase.dart';

@GenerateNiceMocks([MockSpec<MessengerServerRepository>()])
import 'fetch_messages_usecase_test.mocks.dart';

void main() {
  final Message message = Message(id: 2, data: "data", senderId: 4);
  final Message message3 = Message(id: 1, data: "data", senderId: 2);
  final List<Message> listmess = [message, message3];
  test(
    'fetch_messages_usecase_test',
    () async {
      // Act.
      final MessengerServerRepository messengerServerRepository = MockMessengerServerRepository();
      when(messengerServerRepository.fetchMessages()).thenAnswer(
        (_) async {
          return Right(listmess);
        },
      );

      // Arrange.
      final FetchMessagesUseCase fetchMessagesUseCase = FetchMessagesUseCase();
      final result = await fetchMessagesUseCase.call(unit);

      // Assert.
      verify(messengerServerRepository.fetchMessages()).called(1);
      verifyNoMoreInteractions(messengerServerRepository);
      expect(result, Right(listmess));
    },
  );
}
