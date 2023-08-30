import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/search_topic_by_title_usecase.dart';
import 'package:store_client/src/failures/trace_failures.dart';

import '../services/arrange/mock_library_repository.dart';
import '../services/services.dart';

void main() async {
  await initMockService();

  group('Search Topic By Title Use Case', () {
    test('Correct call test', () async {
      // Act
      final LibraryRepository libraryRepository = services<LibraryRepository>();
      final SearchTopicByTitleUseCase searchTopicByTitleUseCase = services<SearchTopicByTitleUseCase>();
      // Arrange
      final Either<Failure, List<Topic>> failOrResult = await searchTopicByTitleUseCase.call(correctTitle);
      //Assert
      expect(failOrResult.isRight(), true);
      verify(libraryRepository.searchTopicByTitle(title: correctTitle)).called(1);
      verifyNoMoreInteractions(libraryRepository);
    });

    test('Incorrect call test', () async {
      // Act
      final LibraryRepository libraryRepository = services<LibraryRepository>();
      final SearchTopicByTitleUseCase searchTopicByTitleUseCase = services<SearchTopicByTitleUseCase>();
      // Arrange
      final Either<Failure, List<Topic>> failOrResult = await searchTopicByTitleUseCase.call(incorrectTitle);
      final bool assertResult = failOrResult.fold(
        (Failure failure) {
          return (failure is IncorrectTopicTitleFailure);
        },
        (List<Topic> listTopics) {
          return false;
        },
      );
      //Assert
      expect(assertResult, true);
      verifyNoMoreInteractions(libraryRepository);
    });
  });
}
