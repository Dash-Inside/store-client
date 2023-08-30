import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/add_topic_usecase.dart';
import 'package:store_client/src/failures/trace_failures.dart';

import '../services/arrange/mock_library_repository.dart';
import '../services/services.dart';

Future<void> main() async {
  await initMockService();

  group('Add Topic Use Case', () {
    test('Correct call test', () async {
      // Act
      final LibraryRepository libraryRepository = services<LibraryRepository>();
      final AddTopicUseCase addTopicUseCase = services<AddTopicUseCase>();

      // Arrange
      final Either<Failure, Unit> failOrResult = await addTopicUseCase.call(correctTopicParams);
      // Assert
      expect(failOrResult.isRight(), true);
      verify(libraryRepository.addTopic(addTopicActionParams: correctTopicParams)).called(1);
      verifyNoMoreInteractions(libraryRepository);
    });

    test('Correct call test', () async {
      // Act
      final LibraryRepository libraryRepository = services<LibraryRepository>();
      final AddTopicUseCase addTopicUseCase = services<AddTopicUseCase>();
      // Arrange
      final Either<Failure, Unit> failOrResult = await addTopicUseCase.call(incorrectTopicParams);
      final bool assertResult = failOrResult.fold(
        (Failure failure) {
          return (failure is IncorrectTopicParamsFailure);
        },
        (Unit unit) {
          return false;
        },
      );

      // Assert
      expect(assertResult, true);
      verifyNoMoreInteractions(libraryRepository);
    });
  });
}
