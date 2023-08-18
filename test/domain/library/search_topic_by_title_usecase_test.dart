import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/search_topic_by_title_usecase.dart';
import '../test_repositories.mocks.dart';

void main() {
  const String title = 'title';
  final Topic topic = Topic(
    id: 1,
    title: "title",
    data: "data",
    links: [],
  );

  test('search_topic_by_title_usecase_test', () async {
    // Act.
    final LibraryRepository libraryRepository = MockLibraryRepository();
    when(libraryRepository.searchTopicByTitle(title: title)).thenAnswer(
      (_) async {
        return Right(topic);
      },
    );

    // Arrange.
    final SearchTopicByTitleUseCase searchTopicByTitleUseCase =
        SearchTopicByTitleUseCase();
    final Either<Failure, Topic> result =
        await searchTopicByTitleUseCase.call(title);

    // Accert.
    verify(libraryRepository.searchTopicByTitle(title: title)).called(1);
    verifyNoMoreInteractions(libraryRepository);
    expect(result, Right(topic));
  });
}
