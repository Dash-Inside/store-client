import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';
import 'package:store_client/src/domain/usecases/library/get_topic_by_id_usecase.dart';
import '../../injector/services.dart';
import 'package:store_client/core/services/services.dart';

Future<void> main() async {
  const int id = 1;
  final Topic topic = Topic(
    id: id,
    title: "title",
    data: "data",
    links: [],
  );
  await initTestServices();
  test('get_topic_by_id_usecase_test', () async {
    // Act.
    final LibraryRepository libraryRepository =
        services.get<LibraryRepository>();
    when(libraryRepository.getTopicDataByID(id: id)).thenAnswer(
      (_) async {
        return Right(topic);
      },
    );

    // Arrange.
    final GetTopicByIDUseCase getTopicByIDUseCase = GetTopicByIDUseCase();
    final Either<Failure, Topic> result = await getTopicByIDUseCase.call(id);

    // Accert.
    verify(libraryRepository.getAllTopicsBySectionID(id: id)).called(1);
    verifyNoMoreInteractions(libraryRepository);
    expect(result, Right(topic));
  });
}
