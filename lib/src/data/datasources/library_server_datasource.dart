import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/models/section_model.dart';
import 'package:store_client/src/data/models/topic_model.dart';
import 'package:store_client/src/domain/entities/section.dart';
import 'package:store_client/src/domain/entities/topic.dart';
import 'package:store_client/src/failures/trace_failures.dart';

class LibraryServerDatasource {
  final Dio _client = Dio();
  final String _baseUrlSections = 'http://127.0.0.1:1337/api/sections';
  final String _baseUrlTopics = 'http://127.0.0.1:1337/api/topics';

  Future<Either<Failure, List<Section>>> getAllSections() async {
    try {
      final Response response = await _client.get(_baseUrlSections);
      final List<dynamic> listMap = response.data['data'];
      List<Section> lsSections = [];

      listMap.forEach((element) {
        lsSections.add(SectionModel.fromMap(element));
      });

      return Right(lsSections);
    } catch (_, stacktrace) {
      return Left(ServerFailureGetSections(stacktrace));
    }
  }

  Future<Either<Failure, Section>> getSectonById({required int id}) async {
    try {
      final Response response = await _client.get('${_baseUrlSections}/$id');
      final Section section = SectionModel.fromMap(response.data['data']);

      return Right(section);
    } catch (_, stacktrace) {
      return Left(ServerFailureGetSections(stacktrace));
    }
  }

  Future<Either<Failure, List<Topic>>> getAllTopics() async {
    try {
      final Response response = await _client.get(_baseUrlTopics);
      final List<dynamic> lsMap = response.data['data'];
      List<Topic> lsTopics = [];

      lsMap.forEach((element) {
        lsTopics.add(TopicModel.fromMap(element));
      });

      return Right(lsTopics);
    } catch (e, stacktrace) {
      return Left(ServerFailureGetTopics(stacktrace));
    }
  }

  Future<Either<Failure, Topic>> getTopicById({required int id}) async {
    try {
      final Response response = await _client.get('${_baseUrlTopics}/$id');
      final Topic topic = TopicModel.fromMap(response.data['data']);

      return Right(topic);
    } catch (e, stacktrace) {
      return Left(ServerFailureGetTopics(stacktrace));
    }
  }

  Future<Either<Failure, Unit>> addTopic({required Topic topic}) async {
    try {
      TopicModel topicModel = TopicModel(
        id: topic.id,
        title: topic.title,
        data: topic.data,
        links: topic.links,
      );

      final Response response = await _client.post(
        _baseUrlTopics,
        data: topicModel.toJson(),
      );

      return Right(unit);
    } catch (e, stacktrace) {
      return Left(ServerFailureSendTopics(stacktrace));
    }
  }
}
