import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/add_favorite_topic_usecase.dart';

@GenerateNiceMocks([MockSpec<LibraryRepository>()])
import 'add_favorite_topic_usecase_test.mocks.dart';

void main() {
  const int id = 1;
  test(
    'add_favorite_topic_usecase_test',
    () async {
      // Act.
      final LibraryRepository libraryRepository = MockLibraryRepository();
      when(libraryRepository.addFavoriteTopic(id: id)).thenAnswer(
        (realInvocation) async {
          return Right(unit);
        },
      );

      // Arrange.
      final AddFavoriteTopicUseCase addFavoriteTopicUseCase = AddFavoriteTopicUseCase();
      final Either<Failure, Unit> result = await addFavoriteTopicUseCase.call(id);

      // Assert.
      verify(libraryRepository.addFavoriteTopic(id: id)).called(1);
      verifyNoMoreInteractions(libraryRepository);
      expect(
        result,
        Right(unit),
      );
    },
  );
}
