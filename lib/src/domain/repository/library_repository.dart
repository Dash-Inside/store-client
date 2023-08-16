import 'package:dartz/dartz.dart';
import 'package:store_client/src/domain/entities/section.dart';
import 'package:store_client/src/domain/entities/topic.dart';

import '../../../core/failure/failure.dart';

abstract class LibraryRepository {
  /// [addFavoriteTopic] returns Either [Failure] if there is some errors or [Topic] if there is no errors
  /// [addFavoriteTopic] takes [id] to save at favourite [Topic]
  Future<Either<Failure, Unit>> addFavoriteTopic({required int id});

  /// [removeFavoriteTopic] returns Either [Failure] if there is some errors or [Topic] if there is no errors
  /// [removeFavoriteTopic] takes [id] remove favourite [Topic]
  Future<Either<Failure, Unit>> removeFavoriteTopic({required int id});

  /// [addTopic] takes [title],[data],[links] to add new [Topic]
  /// [addTopic] add new [Topic]
  Future<Either<Failure, Unit>> addTopic({
    required String title,
    required String data,
    required List<String> links,
  });

  /// [getAllSections] returns Either [Failure] if there is some errors or [List<Section>] if there is no errors
  /// [getAllSections] return all Sections
  Future<Either<Failure, List<Section>>> getAllSections();

  /// [addFavoriteTopic] returns Either [Failure] if there is some errors or [List<Topic>] if there is no errors
  /// [addFavoriteTopic] return all Topics
  Future<Either<Failure, List<Topic>>> getAllTopic();

  /// [getTopicDataByID] returns Either [Failure] if there is some errors or [Topic] if there is no errors
  /// [getTopicDataByID] takes [id] to return the [Topic]
  Future<Either<Failure, Topic>> getTopicDataByID({required int id});

  /// [searchTopicByTitle] returns Either [Failure] if there is some errors or [Topic] if there is no errors
  /// [searchTopicByTitle] takes [title] to return the [Topic]
  Future<Either<Failure, Topic>> searchTopicByTitle({required String title});
}
