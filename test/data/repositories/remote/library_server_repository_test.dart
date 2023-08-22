import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/repositories/remote/library_server_repository.dart';
import 'package:store_client/src/domain/entities/section.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/core/services/services.dart';

import '../../../injector/services.dart';

Future<void> main() async {
  const int id = 1;
  await initTestServices();
  group(
    'group name',
    () {
      test(
        "addFavoriteTopic",
        () async {
          final LibraryServerRepository libraryServerRepository =
              services.get<LibraryServerRepository>();

          final Either<Failure, Unit> result =
              await libraryServerRepository.addFavoriteTopic(id: id);

          verify(libraryServerRepository.addFavoriteTopic(id: id)).called(1);
          verifyNoMoreInteractions(libraryServerRepository);
          expect(result.isRight(), true);
        },
      );

      test(
        "addTopic",
        () async {
          final LibraryServerRepository libraryServerRepository =
              services.get<LibraryServerRepository>();

          final Either<Failure, Unit> result =
              await libraryServerRepository.addTopic(
            title: "title",
            data: "data",
            links: [],
          );
          verify(
            libraryServerRepository.addTopic(
              title: "title",
              data: "data",
              links: [],
            ),
          ).called(1);
          verifyNoMoreInteractions(libraryServerRepository);
          expect(result.isRight(), true);
        },
      );

      test(
        "getAllSections",
        () async {
          final LibraryServerRepository libraryServerRepository =
              services.get<LibraryServerRepository>();

          final Either<Failure, List<Section>> result =
              await libraryServerRepository.getAllSections();
          verify(libraryServerRepository.getAllSections()).called(1);
          verifyNoMoreInteractions(libraryServerRepository);
          expect(result.isRight(), true);
        },
      );

      test(
        "getAllTopicsBySectionID",
        () async {
          final LibraryServerRepository libraryServerRepository =
              services.get<LibraryServerRepository>();

          final Either<Failure, List<Topic>> result =
              await libraryServerRepository.getAllTopicsBySectionID(id: id);
          verify(libraryServerRepository.getAllTopicsBySectionID(id: id))
              .called(1);
          verifyNoMoreInteractions(libraryServerRepository);
          expect(result.isRight(), true);
        },
      );

      test(
        "getTopicDataByID",
        () async {
          final LibraryServerRepository libraryServerRepository =
              services.get<LibraryServerRepository>();

          final Either<Failure, Topic> result =
              await libraryServerRepository.getTopicDataByID(id: id);
          verify(libraryServerRepository.getTopicDataByID(id: id)).called(1);
          verifyNoMoreInteractions(libraryServerRepository);
          expect(result.isRight(), true);
        },
      );

      test(
        "removeFavoriteTopic",
        () async {
          final LibraryServerRepository libraryServerRepository =
              services.get<LibraryServerRepository>();

          final Either<Failure, Unit> result =
              await libraryServerRepository.removeFavoriteTopic(id: id);
          verify(libraryServerRepository.removeFavoriteTopic(id: id)).called(1);
          verifyNoMoreInteractions(libraryServerRepository);
          expect(result.isRight(), true);
        },
      );

      test(
        "searchTopicByTitle",
        () async {
          final LibraryServerRepository libraryServerRepository =
              services.get<LibraryServerRepository>();

          final Either<Failure, Topic> result =
              await libraryServerRepository.searchTopicByTitle(title: 'title');
          verify(libraryServerRepository.searchTopicByTitle(title: 'title'))
              .called(1);
          verifyNoMoreInteractions(libraryServerRepository);
          expect(result.isRight(), true);
        },
      );
    },
  );
}
