import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/add_favorite_topic_usecase.dart';

import '../../injector/services.dart';
import 'package:store_client/core/services/services.dart';

Future<void> main() async {
  const int id = 1;
  await initTestServices();
  test(
    'add_favorite_topic_usecase_test',
    () async {
      // Act.

      final LibraryRepository libraryRepository =
          services.get<LibraryRepository>();
      when(libraryRepository.addFavoriteTopic(id: id)).thenAnswer(
        (_) async {
          return Right(unit);
        },
      );

      // Arrange.
      final AddFavoriteTopicUseCase addFavoriteTopicUseCase =
          AddFavoriteTopicUseCase();
      final Either<Failure, Unit> result =
          await addFavoriteTopicUseCase.call(id);

      // Assert.
      verify(libraryRepository.addFavoriteTopic(id: id)).called(1);
      verifyNoMoreInteractions(libraryRepository);
      expect(result, Right(unit));
    },
  );
}
