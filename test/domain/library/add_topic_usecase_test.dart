import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/add_topic_usecase.dart';

import '../../injector/services.dart';

Future<void> main() async {
  const String title = 'title';
  const String data = 'data';
  const List<String> links = ['links'];
  final AddTopicUseCaseParams addTopicUseCaseParams = AddTopicUseCaseParams(title, data, links);
  await initTestServices();

  test(
    "add_topic_usecase_test",
    () async {
      // Act.
      final LibraryRepository libraryRepository = testServices.get<LibraryRepository>();
      when(libraryRepository.addTopic(
        title: title,
        data: data,
        links: links,
      )).thenAnswer(
        (_) async {
          return Right(unit);
        },
      );

      // Arrange.
      final AddTopicUseCase addTopicUseCase = AddTopicUseCase();
      final Either<Failure, Unit> result = await addTopicUseCase.call(addTopicUseCaseParams);

      // Assert.
      verify(libraryRepository.addTopic(
        title: title,
        data: data,
        links: links,
      )).called(1);
      verifyNoMoreInteractions(libraryRepository);
      expect(result, Right(unit));
    },
  );
}
