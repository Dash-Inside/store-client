import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/src/domain/entities/message.dart';
import 'package:store_client/src/failures/trace_failures.dart';

import '../../domain/usecase/mock/test_repositories.mocks.dart';

final Message message = Message(id: 1, data: "data", senderId: 3);
final Message incorrectMessage = Message(id: -1, data: "data", senderId: 3);
final List<Message> listMessage = [message];

MockMessengerRepository arrangeMockMessengerRepository() {
  final MockMessengerRepository mockMessengerRepository = MockMessengerRepository();

  when(mockMessengerRepository.fetchMessages()).thenAnswer((_) async {
    return Right(listMessage);
  });

  when(mockMessengerRepository.sendMessage(message: message)).thenAnswer((_) async {
    return Right(unit);
  });

  when(mockMessengerRepository.sendMessage(message: incorrectMessage)).thenAnswer((_) async {
    return Left(ExtraFailure(StackTrace.empty));
  });

  return mockMessengerRepository;
}
