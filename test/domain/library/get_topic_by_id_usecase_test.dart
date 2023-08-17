import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/src/domain/repository/library_repository.dart';

@GenerateNiceMocks([MockSpec<LibraryRepository>()])
import 'get_topic_by_id_usecase_test.mocks.dart';

void main() {
  final int id = 1;
  test('get_topic_by_id_usecase_test', () {
    // Act.
    LibraryRepository libraryRepository = MockLibraryRepository();
    when(libraryRepository.getTopicDataByID(id: id)).thenAnswer(() )
    // Arrange.
    // Accert.
  });
}
