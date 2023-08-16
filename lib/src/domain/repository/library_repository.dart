import 'package:dartz/dartz.dart';
import 'package:store_client/src/domain/entities/topic.dart';

import '../../../core/failure/failure.dart';

abstract class LibraryRepository {
  /// [addFavouriteTopic] returns Either [Failure] if there is some errors or [Topic] if there is no errors
  /// [read] takes [id] to save at favourite [Topic]
  Future<Either<Failure, Topic>> addFavouriteTopic({required int id});

  /// Takes [title],[data],[links] to add new [Topic]
  Future<Topic> addTopic({required String title, required String data, required List<String> links});

  /// Show all [sections]
  Future<void> getAllSections();

  /// Show all [topic]
  Future<void> getAllTopic();

  /// [getTopicByID] returns Either [Failure] if there is some errors or [Topic] if there is no errors
  /// [getTopicByID] takes [id] to return the [Topic]
  Future<Either<Failure, Topic>> getTopicByID({required int id});

  /// [removeFavouriteTopic] returns Either [Failure] if there is some errors or [Topic] if there is no errors
  /// [removeFavouriteTopic] takes [id] remove favourite [Topic]
  Future<Either<Failure, Unit>> removeFavouriteTopic({required int id});

  /// [searchTopicByTitle] returns Either [Failure] if there is some errors or [Topic] if there is no errors
  /// [searchTopicByTitle] takes [title] to return the [Topic]
  Future<Either<Failure, Topic>> searchTopicByTitle({required String title});
}
