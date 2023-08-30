import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/add_favorite_topic_usecase.dart';
import 'package:store_client/src/failures/trace_failures.dart';

import '../services/arrange/mock_library_repository.dart';
import '../services/services.dart';

Future<void> main() async {
  await initMockService();
  group('Add Favorite Topic Use Case', () {
    test('Correct call test', () async {
      // Act
      final LibraryRepository libraryRepository = services<LibraryRepository>();
      final AddFavoriteTopicUseCase addFavoriteTopicUseCase = services<AddFavoriteTopicUseCase>();
      // Arrange
      final Either<Failure, Unit> failOrResult = await addFavoriteTopicUseCase.call(correctId);
      // Assert
      expect(failOrResult.isRight(), true);
      verify(libraryRepository.addFavoriteTopic(id: correctId)).called(1);
      verifyNoMoreInteractions(libraryRepository);
    });

    test('Incorrect call test', () async {
      // Act
      final LibraryRepository libraryRepository = services<LibraryRepository>();
      final AddFavoriteTopicUseCase addFavoriteTopicUseCase = services<AddFavoriteTopicUseCase>();
      // Arrange
      final Either<Failure, Unit> failOrResult = await addFavoriteTopicUseCase.call(incorrectId);
      final bool assertResult = failOrResult.fold(
        (Failure failure) {
          return (failure is IncorrectTopicIdFailure);
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
