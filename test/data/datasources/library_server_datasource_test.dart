import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/core/services/services.dart';
import 'package:store_client/src/data/datasources/library_server_datasource.dart';
import 'package:store_client/src/data/models/section_model.dart';
import 'package:store_client/src/data/models/topic_model.dart';

import '../../injector/services.dart';

void main() async {
  const int id = 1;
  const int incorrectId = -666;
  const String title = 'title';
  const int topicId = 1;
  const String data = 'data';
  const List<String> links = ['links'];
  const int userId = 1;
  SectionModel sectionModel = SectionModel(
    id: id,
    title: title,
    topicId: topicId,
  );

  TopicModel topicModel = TopicModel(
    id: id,
    title: title,
    data: data,
    links: links,
  );

  await initTestServices();
  group('library_server_datasource_test', () {
    test('method getAllSections test', () async {
      final LibraryServerDatasource libraryServerDatasource =
          services<LibraryServerDatasource>();

      final Either<Failure, List<SectionModel>> result =
          await libraryServerDatasource.getAllSections();

      expect(result.isRight(), true);
    });

    group('method getConcreteSection test', () {
      test('getConcreteSection true', () async {
        final LibraryServerDatasource libraryServerDatasource =
            services<LibraryServerDatasource>();

        final Either<Failure, SectionModel> result =
            await libraryServerDatasource.getConcreteSection(id: id);

        expect(result.isRight(), true);
      });

      test('getConcreteSection false', () async {
        final LibraryServerDatasource libraryServerDatasource =
            services<LibraryServerDatasource>();

        final Either<Failure, SectionModel> result =
            await libraryServerDatasource.getConcreteSection(id: incorrectId);

        expect(result.isLeft(), true);
      });
    });

    test('method addSection test', () async {
      final LibraryServerDatasource libraryServerDatasource =
          services<LibraryServerDatasource>();

      final Either<Failure, SectionModel> result =
          await libraryServerDatasource.addSection(
        title: title,
        topicId: topicId,
      );

      expect(result, sectionModel);
    });

    group('method updateSection test', () {
      test('updateSection with params', () async {
        final LibraryServerDatasource libraryServerDatasource =
            services<LibraryServerDatasource>();

        /// создать поля для изменения + добавить updatedSection
        final Either<Failure, SectionModel> result =
            await libraryServerDatasource.updateSection(
          id: id,
          title: title,
          topicId: topicId,
        );

        expect(result, sectionModel);
      });

      test('updateSection without params', () async {
        final LibraryServerDatasource libraryServerDatasource =
            services<LibraryServerDatasource>();

        final Either<Failure, SectionModel> result =
            await libraryServerDatasource.updateSection(
          id: id,
        );

        expect(result.isRight(), true);
        // добавить expect на sectionModel
      });
    });

    test('method getAllTopics test', () async {
      final LibraryServerDatasource libraryServerDatasource =
          services<LibraryServerDatasource>();

      final Either<Failure, List<TopicModel>> result =
          await libraryServerDatasource.getAllTopics();

      expect(result.isRight(), true);
    });

    test('method getConcreteTopicByID test', () async {
      final LibraryServerDatasource libraryServerDatasource =
          services<LibraryServerDatasource>();

      final Either<Failure, TopicModel> result =
          await libraryServerDatasource.getConcreteTopicByID(id: id);

      expect(result, topicModel);
    });

    group('method updateTopic test', () {
      test('method updateTopic with params test ', () async {
        final LibraryServerDatasource libraryServerDatasource =
            services<LibraryServerDatasource>();

        /// тоже самое
        final Either<Failure, TopicModel> result =
            await libraryServerDatasource.updateTopic(
          id: id,
          title: title,
          data: data,
          links: links,
        );

        expect(result, sectionModel);
      });

      test('method updateTopic with params test', () async {
        final LibraryServerDatasource libraryServerDatasource =
            services<LibraryServerDatasource>();

        final Either<Failure, TopicModel> result =
            await libraryServerDatasource.updateTopic(
          id: id,
        );

        expect(result.isRight(), true);
        // expect
      });
    });

    test('method addTopic test', () async {
      final LibraryServerDatasource libraryServerDatasource =
          services<LibraryServerDatasource>();

      final Either<Failure, TopicModel> result =
          await libraryServerDatasource.addTopic(
        data: data,
        links: links,
        title: title,
      );

      expect(result, topicModel);
    });

    test('method getAllFavorite test', () async {
      final LibraryServerDatasource libraryServerDatasource =
          services<LibraryServerDatasource>();

      final Either<Failure, List<TopicModel>> result =
          await libraryServerDatasource.getAllFavorite(userId: userId);

      expect(result.isRight(), true);
    });

    test('method getConcreteFavorite test', () async {
      final LibraryServerDatasource libraryServerDatasource =
          services<LibraryServerDatasource>();

      final Either<Failure, TopicModel> result =
          await libraryServerDatasource.getConcreteFavorite(
        userId: userId,
        id: id,
      );

      expect(result.isRight(), true);
    });

    test('method addFavoriteTopic test', () async {
      final LibraryServerDatasource libraryServerDatasource =
          services<LibraryServerDatasource>();

      final Either<Failure, TopicModel> result =
          await libraryServerDatasource.addFavoriteTopic(
        id: id,
        userId: userId,
      );

      expect(result, topicModel);
    });

    test('method deleteConcreteFavorite test', () async {
      final LibraryServerDatasource libraryServerDatasource =
          services<LibraryServerDatasource>();

      final Either<Failure, TopicModel> result =
          await libraryServerDatasource.deleteConcreteFavorite(
        topicId: id,
        userId: userId,
      );

      expect(result, topicModel);
    });
  });
}
