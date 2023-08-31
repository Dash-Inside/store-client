import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/get_all_topics_by_section_id_usecase.dart';
import 'package:store_client/src/failures/trace_failures.dart';

import '../services/arrange/mock_library_repository.dart';
import '../services/services.dart';

Future<void> main() async {
  await initMockService();

  group('Get All Topics By Id Use Case', () {
    test('Correct call test', () async {
      // Act
      final LibraryRepository libraryRepository = services<LibraryRepository>();
      final GetAllTopicsBySectionIDUseCase getAllTopicsBySectionIDUseCase = services<GetAllTopicsBySectionIDUseCase>();
      // Arrange
      final Either<Failure, List<Topic>> failOrResult = await getAllTopicsBySectionIDUseCase.call(correctId);
      //Assert
      expect(failOrResult.isRight(), true);
      verify(libraryRepository.getAllTopicsBySectionID(id: correctId)).called(1);
      verifyNoMoreInteractions(libraryRepository);
    });

    test('Incorrect call test', () async {
      // Act
      final LibraryRepository libraryRepository = services<LibraryRepository>();
      final GetAllTopicsBySectionIDUseCase getAllTopicsBySectionIDUseCase = services<GetAllTopicsBySectionIDUseCase>();
      // Arrange
      final Either<Failure, List<Topic>> failOrResult = await getAllTopicsBySectionIDUseCase.call(incorrectId);
      final bool assertResult = failOrResult.fold(
        (Failure failure) {
          return (failure is IncorrectSectionIdFailure);
        },
        (List<Topic> list) {
          return false;
        },
      );
      //Assert
      expect(assertResult, true);
      verifyNoMoreInteractions(libraryRepository);
    });
  });
}
