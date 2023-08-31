import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/get_topic_by_id_usecase.dart';
import 'package:store_client/src/failures/trace_failures.dart';

import '../services/arrange/mock_library_repository.dart';
import '../services/services.dart';

Future<void> main() async {
  await initMockService();
  group('Get Topic By Id Use Case', () {
    test('Correct call test', () async {
      // Act
      final LibraryRepository libraryRepository = services<LibraryRepository>();
      final GetTopicByIDUseCase getTopicByIDUseCase = services<GetTopicByIDUseCase>();
      // Arrange
      final Either<Failure, Topic> failOrResult = await getTopicByIDUseCase.call(correctId);
      // Assert
      expect(failOrResult.isRight(), true);
      verify(libraryRepository.getTopicDataByID(id: correctId)).called(1);
      verifyNoMoreInteractions(libraryRepository);
    });

    test('Incorrect call test', () async {
      // Act
      final LibraryRepository libraryRepository = services<LibraryRepository>();
      final GetTopicByIDUseCase getTopicByIDUseCase = services<GetTopicByIDUseCase>();
      // Arrange
      final Either<Failure, Topic> failOrResult = await getTopicByIDUseCase.call(incorrectId);
      final bool assertResult = failOrResult.fold(
        (Failure failure) {
          return (failure is IncorrectTopicIdFailure);
        },
        (Topic topic) {
          return false;
        },
      );
      // Assert
      expect(assertResult, true);
      verifyNoMoreInteractions(libraryRepository);
    });
  });
}
