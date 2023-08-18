import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/remove_favorite_topic_usecase.dart';
import '../../injector/services.dart';

Future<void> main() async {
  const int id = 1;
  test('remove_favorite_topic_usecase_test', () async {
    // Act.
    final LibraryRepository libraryRepository = testServices.get<LibraryRepository>();
    when(libraryRepository.removeFavoriteTopic(id: id)).thenAnswer(
      (_) async {
        return Right(unit);
      },
    );
    await initTestServices();
    // Arrange.
    final RemoveFavoriteTopicUseCase removeFavoriteTopicUseCase = RemoveFavoriteTopicUseCase();
    final Either<Failure, Unit> result = await removeFavoriteTopicUseCase.call(id);

    // Accert.
    verify(libraryRepository.removeFavoriteTopic(id: id)).called(1);
    verifyNoMoreInteractions(libraryRepository);
    expect(result, Right(unit));
  });
}
