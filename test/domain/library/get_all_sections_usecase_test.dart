import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/section.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/get_all_sections_usecase.dart';
import '../../injector/services.dart';

Future<void> main() async {
  final Section section = Section(
    id: 1,
    title: "title",
    topicId: 3,
  );
  final List<Section> listSection = [section, section];
  await initTestServices();
  test(
    "get_all_sections_usecase_test",
    () async {
      // Act.
      final LibraryRepository libraryRepository = testServices.get<LibraryRepository>();
      when(libraryRepository.getAllSections()).thenAnswer((_) async {
        return Right(listSection);
      });

      // Arrange.
      final GetAllSectionsUseCase getAllSectionsUseCase = GetAllSectionsUseCase();
      final Either<Failure, List<Section>> result = await getAllSectionsUseCase.call(unit);

      // Assert.
      verify(libraryRepository.getAllSections()).called(1);
      verifyNoMoreInteractions(libraryRepository);
      expect(result, Right(listSection));
    },
  );
}
