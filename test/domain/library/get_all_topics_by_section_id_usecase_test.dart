import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/get_all_topics_by_section_id_usecase.dart';
import '../../injector/services.dart';

Future<void> main() async {
  const int id = 1;
  final Topic topic = Topic(
    id: id,
    title: "title",
    data: "data",
    links: [],
  );
  await initTestServices();
  final List<Topic> listTopic = [topic, topic];

  test(
    'get_all_topics_by_section_id_usecase_test',
    () async {
      // Act.
      final LibraryRepository libraryRepository = services.get<LibraryRepository>();
      when(libraryRepository.getAllTopicsBySectionID(id: id)).thenAnswer(
        (_) async {
          return Right(listTopic);
        },
      );

      // Arrange.
      final GetAllTopicsBySectionIDUseCase getAllTopicsBySectionIDUseCase = GetAllTopicsBySectionIDUseCase();
      final Either<Failure, List<Topic>> result = await getAllTopicsBySectionIDUseCase.call(id);

      // Assert.
      verify(libraryRepository.getAllTopicsBySectionID(id: id)).called(1);
      verifyNoMoreInteractions(libraryRepository);
      expect(result, Right(listTopic));
    },
  );
}
