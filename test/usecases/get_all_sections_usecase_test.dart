import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/domain/entities/section.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/get_all_sections_usecase.dart';

import '../services/services.dart';

Future<void> main() async {
  await initMockService();

  group('Get All Sections Use Case', () {
    test('Correct call test', () async {
      // Act
      final LibraryRepository libraryRepository = services<LibraryRepository>();
      final GetAllSectionsUseCase getAllSectionsUseCase = services<GetAllSectionsUseCase>();
      // Arrange
      final Either<Failure, List<Section>> failOrResult = await getAllSectionsUseCase.call(unit);
      // Assert
      expect(failOrResult.isRight(), true);
      verify(libraryRepository.getAllSections()).called(1);
      verifyNoMoreInteractions(libraryRepository);
    });
  });
}
