import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/domain/repository/messenger_repository.dart';
import 'package:store_client/src/domain/usecases/messenger/fetch_messages_usecase.dart';

import '../../../injector/services.dart';

void main() async {
  await initMockServices();
  await initUseCaseServices();
  group('method fetchMessages test', () {
    test('correct fetchMessages test', () async {
      // Act.
      final MessengerRepository messengerRepository = services<MessengerRepository>();
      final FetchMessagesUseCase fetchMessagesUseCase = services<FetchMessagesUseCase>();

      // Arrange.
      final Either<Failure, List<Message>> failOrMessages = await fetchMessagesUseCase.call(unit);

      // Accert.
      expect(failOrMessages.isRight(), true);
      verify(messengerRepository.fetchMessages()).called(1);
      verifyNoMoreInteractions(messengerRepository);
    });
  });
}
