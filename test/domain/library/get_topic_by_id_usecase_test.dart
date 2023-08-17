import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/get_topic_by_id_usecase.dart';

@GenerateNiceMocks([MockSpec<LibraryRepository>()])
import 'get_topic_by_id_usecase_test.mocks.dart';

void main() {
  const int id = 1;
  final Topic topic = Topic(
    id: id,
    title: "title",
    data: "data",
    links: [],
  );

  test('get_topic_by_id_usecase_test', () async {
    // Act.
    final LibraryRepository libraryRepository = MockLibraryRepository();
    when(libraryRepository.getTopicDataByID(id: id)).thenAnswer(
      (_) async {
        return Right(topic);
      },
    );

    // Arrange.
    final GetTopicByIDUseCase getTopicByIDUseCase = GetTopicByIDUseCase();
    final result = await getTopicByIDUseCase.call(id);

    // Accert.
    verify(libraryRepository.getAllTopicsBySectionID(id: id)).called(1);
    verifyNoMoreInteractions(libraryRepository);
    expect(result, Right(topic));
  });
}
