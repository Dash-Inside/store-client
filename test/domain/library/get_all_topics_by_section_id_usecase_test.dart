import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/get_all_topics_by_section_id_usecase.dart';

@GenerateNiceMocks([MockSpec<LibraryRepository>()])
import 'get_all_topics_by_section_id_usecase_test.mocks.dart';

void main() {
  const int id = 1;
  final Topic topic = Topic(
    id: id,
    title: "title",
    data: "data",
    links: [],
  );
  final List<Topic> listTopic = [topic];
  test(
    'get_all_topics_by_section_id_usecase_test',
    () async {
      // Act.
      final LibraryRepository libraryRepository = MockLibraryRepository();
      when(libraryRepository.getAllTopicsBySectionID(id: id)).thenAnswer(
        (_) async {
          return Right(listTopic);
        },
      );

      // Arrange.
      final GetAllTopicsBySectionIDUseCase getAllTopicsBySectionIDUseCase = GetAllTopicsBySectionIDUseCase();
      final result = getAllTopicsBySectionIDUseCase.call(id);

      // Assert.
      verify(libraryRepository.getAllTopicsBySectionID(id: id)).called(1);
      verifyNoMoreInteractions(libraryRepository);
      expect(
        result,
        Right(listTopic),
      );
    },
  );
}
