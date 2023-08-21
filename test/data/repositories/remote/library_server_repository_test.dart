import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/datasources/library_server_datasource.dart';
import 'package:store_client/src/data/repositories/remote/library_server_repository.dart';
import 'package:store_client/src/domain/entities/section.dart';
import 'package:store_client/src/domain/entities/topic.dart';

import '../../../injector/services.dart';

Future<void> main() async {
  const int id = 1;
  final Section section = Section(id: 1, title: "title", topicId: 3);
  final List<Section> listSec = [section];
  await initTestServices();
  group(
    'group name',
    () {
      test(
        "addFavoriteTopic",
        () async {
          final LibraryServerRepository libraryServerRepository = testServices.get<LibraryServerRepository>();

          final Either<Failure, Unit> result = await libraryServerRepository.addFavoriteTopic(id: id);

          expect(result.isRight(), true);
        },
      );

      test(
        "addTopic",
        () async {
          final LibraryServerRepository libraryServerRepository = testServices.get<LibraryServerRepository>();

          final Either<Failure, Unit> result = await libraryServerRepository.addTopic(
            title: "title",
            data: "data",
            links: [],
          );

          expect(result.isRight(), true);
        },
      );

      test(
        "getAllSections",
        () async {
          final LibraryServerRepository libraryServerRepository = testServices.get<LibraryServerRepository>();

          final Either<Failure, List<Section>> result = await libraryServerRepository.getAllSections();

          expect(result.isRight(), true);
        },
      );

      test(
        "getAllTopicsBySectionID",
        () async {
          final LibraryServerRepository libraryServerRepository = testServices.get<LibraryServerRepository>();

          final Either<Failure, List<Topic>> result = await libraryServerRepository.getAllTopicsBySectionID(id: id);

          expect(result.isRight(), true);
        },
      );

      test(
        "getTopicDataByID",
        () async {
          final LibraryServerRepository libraryServerRepository = testServices.get<LibraryServerRepository>();

          final Either<Failure, Topic> result = await libraryServerRepository.getTopicDataByID(id: id);

          expect(result.isRight(), true);
        },
      );

      test(
        "removeFavoriteTopic",
        () async {
          final LibraryServerRepository libraryServerRepository = testServices.get<LibraryServerRepository>();

          final Either<Failure, Unit> result = await libraryServerRepository.removeFavoriteTopic(id: id);

          expect(result.isRight(), true);
        },
      );

      test(
        "searchTopicByTitle",
        () async {
          final LibraryServerRepository libraryServerRepository = testServices.get<LibraryServerRepository>();

          final Either<Failure, Topic> result = await libraryServerRepository.searchTopicByTitle(title: 'title');

          expect(result.isRight(), true);
        },
      );
    },
  );
}
