import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_client/core/failure/failure.dart';
import 'package:store_client/src/data/data_failures/data_failure.dart';
import 'package:store_client/src/data/models/section_model.dart';
import 'package:store_client/src/data/models/topic_model.dart';
import 'package:store_client/src/domain/entities/section.dart';
import 'package:store_client/src/domain/entities/topic.dart';

class LibraryServerDatasource {
  final Dio _client = Dio();
  final String _sectionURL = 'http://127.0.0.1:1337/api/sections';
  final String _topicURL = 'http://127.0.0.1:1337/api/topics';
  final String _favoriteTopicURL = 'http://127.0.0.1:1337/api/favotites';

  Future<Either<Failure, List<SectionModel>>> getAllSections() async {
    try {
      final Response response = await _client.get(_sectionURL);
      final List<dynamic> listMap = response.data['data'];
      List<Section> listSections = [];

      listMap.forEach((element) {
        listSections.add(SectionModel.fromMap(element));
      });

      return Right(listSections);
    } catch (_e, stacktrace) {
      return Left(ServerFailureGetSections(stacktrace));
    }
  }

  Future<Either<Failure, SectionModel>> getConcreteSection({required int id}) async {
    try {
      final Response response = await _client.get('${_sectionURL}/$id');
      final Section section = SectionModel.fromMap(response.data['data']);

      return Right(section);
    } catch (_e, stacktrace) {
      return Left(ServerFailureGetSections(stacktrace));
    }
  }

  Future<Either<Failure, SectionModel>> addSection({
    required int id,
    required String title,
    required int topicId,
  }) async {
    try {
      SectionModel sectionModel = SectionModel(
        title: section.title,
        id: section.id,
        topicId: section.topicId,
      );

      final Response response = await _client.post(
        _sectionURL,
        data: <String, dynamic>{
          'data': {
            'title': section.title,
            'topicID': section.topicId,
            'id': section.id,
          },
        },
      );

      return Right(unit);
    } catch (_e, stacktrace) {
      return Left(ServerFailureSendSections(stacktrace));
    }
  }

  Future<Either<Failure, SectionModel>> updateSection({
    required int id,
    String? title,
    int? topicId,
  }) async {
    try {
      final Response response2 = await _client.put(
        ('${_sectionURL}/${section.id}'),
        data: jsonEncode(
          <String, dynamic>{
            'data': {
              'title': section.title,
              'topicID': section.topicId,
            },
          },
        ),
      );

      return Right(unit);
    } catch (_e, stacktrace) {
      return Left(ServerFailureSendSections(stacktrace));
    }
  }

  Future<Either<Failure, List<TopicModel>>> getAllTopics() async {
    try {
      final Response response = await _client.get(_topicURL);
      final List<dynamic> listMap = response.data['data'];
      List<TopicModel> listTopics = [];

      listMap.forEach((element) {
        listTopics.add(TopicModel.fromMap(element as Map<String, dynamic>));
      });
      print(listTopics);
      return Right(listTopics);
    } catch (e, stackTrace) {
      return Left(DataFailure(message: '$e', stackTrace: stackTrace));
    }
  }

  Future<Either<Failure, TopicModel>> getConcreteTopicByID({required int id}) async {
    try {
      final Response response = await _client.get('${_topicURL}/$id');
      final Topic topic = TopicModel.fromMap(response.data['data']);

      return Right(topic);
    } catch (_e, stacktrace) {
      return Left(ServerFailureGetTopics(stacktrace));
    }
  }

  Future<Either<Failure, TopicModel>> updateTopic({
    required int id,
    String? title,
    String? data,
    List<String>? links,
  }) async {
    try {
      final Response response2 = await _client.put(
        ('${_topicURL}/${topic.id}'),
        data: jsonEncode(topic.toMap()),
      );

      return Right(unit);
    } catch (_e, stacktrace) {
      return Left(ServerFailureSendSections(stacktrace));
    }
  }

  Future<Either<Failure, TopicModel>> addTopic({
    required String title,
    required String data,
    required List<String> links,
  }) async {
    try {
      TopicModel topicModel = TopicModel(
        id: topic.id,
        title: topic.title,
        data: topic.data,
        links: topic.links,
      );

      final Response response = await _client.post(
        _topicURL,
        data: topicModel.toJson(),
      );

      return Right(unit);
    } catch (_e, stacktrace) {
      return Left(ServerFailureSendTopics(stacktrace));
    }
  }

  Future<Either<Failure, List<TopicModel>>> getAllFavorite() async {
    try {
      final Response response = await _client.get(_favoriteTopicURL);
      final List<dynamic> listMap = response.data['data'];
      List<Topic> listFavorite = [];

      listMap.forEach((element) {
        listFavorite.add(TopicModel.fromMap(element));
      });

      return Right(listFavorite);
    } catch (_e, stacktrace) {
      return Left(ServerFailureGetSections(stacktrace));
    }
  }

  Future<Either<Failure, TopicModel>> getConcreteFavorite({required int id}) async {
    try {
      final Response response = await _client.get('${_favoriteTopicURL}/$id');
      final Topic favoriteTopic = TopicModel.fromMap(response.data['data']);

      return Right(favoriteTopic);
    } catch (_e, stacktrace) {
      return Left(ServerFailureGetSections(stacktrace));
    }
  }

  Future<Either<Failure, TopicModel>> addFavoriteTopic({required int id}) async {
    try {
      final Response response2 = await _client.post(
        _favoriteTopicURL,
        data: await _client.get('${_topicURL}/$id'),
      );

      return Right(unit);
    } catch (_e, stacktrace) {
      return Left(ServerFailureSendTopics(stacktrace));
    }
  }

  Future<Either<Failure, TopicModel>> deleteConcreteFavorite({required int id}) async {
    try {
      final Response response = await _client.delete('${_favoriteTopicURL}/$id');

      return Right(unit);
    } catch (_e, stacktrace) {
      return Left(ServerFailureGetSections(stacktrace));
    }
  }
}
