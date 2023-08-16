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

  /// Takes [title],[data],[links] to add new [Topic]
  Future<Either<Failure, Unit>> addTopic({required String title, required String data, required List<String> links});

  /// Show all [Section]
  Future<List<Section>> getAllSections();

  /// Show all [Topic]
  Future<List<Topic>> getAllTopic();

  /// [getTopicDataByID] returns Either [Failure] if there is some errors or [Topic] if there is no errors
  /// [getTopicDataByID] takes [id] to return the [Topic]
  Future<Either<Failure, Topic>> getTopicDataByID({required int id});

  /// [searchTopicByTitle] returns Either [Failure] if there is some errors or [Topic] if there is no errors
  /// [searchTopicByTitle] takes [title] to return the [Topic]
  Future<Either<Failure, Topic>> searchTopicByTitle({required String title});
}
